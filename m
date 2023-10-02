Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F08E97B52E2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 14:22:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=BSfFWDQ4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzg7s6CGkz3vY4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 23:22:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=BSfFWDQ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rzg6y5Nm7z2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 23:21:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=F9eLwgO+MkVIbXgjb3UHbTj6w2g/gdCYsvQUqOspZFo=; b=BSfFWDQ4PQPCxGYsGJnFNUzeok
	aeaAaYrnZz/xsH/XEMEksDy70JLL6u5H4eKtvzPjPrQOR41Jzl8owTGhCF4BC4/6EKkcF0d3oP4if
	760+TYSt+OJWpVInI4E6P3bcuTmrk+vN6pZ9FTlcN6KL8x/UKkD4i3mi3WeyhyXQn/jd6KD+FGWON
	nVrZ8k229I99CCEHUrTyKDUlsv3Azxo8cfYDwW26YE+EEipNX47SLL/io/7FWYSdGgzvVpHGMFzUR
	PI+Qqi7fl0AF2eRLzsoA5cz2R3CAYYHmJsrqjc/K0/AmHtqv4cN9I01UK+mdSQZzqHLjJtGxZ3VR4
	10H9cDfA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1qnHvZ-002M2W-2e;
	Mon, 02 Oct 2023 12:21:33 +0000
Date: Mon, 2 Oct 2023 12:21:33 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4] powerpc: Use shared font data
Message-ID: <ZRq1zUTmnydbEk2S@gallifrey>
References: <20230825142754.1487900-1-linux@treblig.org>
 <ZRgfVfaIkEWsL8Ha@gallifrey>
 <87a5t2sfxx.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87a5t2sfxx.fsf@mail.lhotse>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-12-amd64 (x86_64)
X-Uptime: 12:21:14 up 16 days, 15:19,  2 users,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.9 (2022-11-12)
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
Cc: sam@ravnborg.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman (mpe@ellerman.id.au) wrote:
> "Dr. David Alan Gilbert" <linux@treblig.org> writes:
> > * linux@treblig.org (linux@treblig.org) wrote:
> >> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >> 
> >> PowerPC has a 'btext' font used for the console which is almost identical
> >> to the shared font_sun8x16, so use it rather than duplicating the data.
> >
> > Hi Michael,
> >   Are you going to pick this up for 6.7?
> 
> Yes I will.

Thanks!

Dave

> cheers
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
