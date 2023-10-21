Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 545407D1E46
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Oct 2023 18:33:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=PdJE3qT4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SCRpv1rHSz3dfb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Oct 2023 03:33:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=PdJE3qT4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SCRp03SSMz3bTn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Oct 2023 03:32:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 781FFCE13E0;
	Sat, 21 Oct 2023 16:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261F3C433C8;
	Sat, 21 Oct 2023 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697905971;
	bh=J0YExM0i9UyGR28fuSNSuiNULcDD5AwOsLxt/rxGPN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PdJE3qT4Sz+2st1qtPL0++FJpfbjfyZ1T9tVqqaXeIN0f0JAM94vs+LtZUvZcsFYQ
	 i2sA8e6eG4g1IMJIFyEOUDUboczRLoUL+oig1nGVB0pQ/8YK4J/umno0Dwj5r5mCBl
	 3nRqMnHJ18/H25w0WNfnrc01BDLIxlofdfkqGK8k=
Date: Sat, 21 Oct 2023 18:32:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 1/3] hvc/xen: fix event channel handling for secondary
 consoles
Message-ID: <2023102129-humongous-grant-4576@gregkh>
References: <20231020161529.355083-1-dwmw2@infradead.org>
 <20231020161529.355083-2-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020161529.355083-2-dwmw2@infradead.org>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org, Dawei Li <set_pte_at@outlook.com>, Jiri Slaby <jirislaby@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 20, 2023 at 05:15:27PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The xencons_connect_backend() function allocates a local interdomain
> event channel with xenbus_alloc_evtchn(), then calls
> bind_interdomain_evtchn_to_irq_lateeoi() to bind to that port# on the
> *remote* domain.
> 
> That doesn't work very well:
> 
> (qemu) device_add xen-console,id=con1,chardev=pty0
> [   44.323872] xenconsole console-1: 2 xenbus_dev_probe on device/console/1
> [   44.323995] xenconsole: probe of console-1 failed with error -2
> 
> Fix it to use bind_evtchn_to_irq_lateeoi(), which does the right thing
> by just binding that *local* event channel to an irq. The backend will
> do the interdomain binding.
> 
> This didn't affect the primary console because the setup for that is
> special — the toolstack allocates the guest event channel and the guest
> discovers it with HVMOP_get_param.
> 
> Fixes: fe415186b4 ("xen/console: harden hvc_xen against event channel storms")

Nit, our tools complain that the sha1 isn't big enough, "fe415186b43d"
I'll go fix it up...

