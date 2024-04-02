Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 892F3894879
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 02:28:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=cpIC1dv6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7pd62TJMz3dVp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 11:28:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=cpIC1dv6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xry111.site (client-ip=89.208.246.23; helo=xry111.site; envelope-from=xry111@xry111.site; receiver=lists.ozlabs.org)
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7pcL4B0cz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 11:27:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1712017644;
	bh=fIGYmiYD8AMZwe+4Gsw6nOssrG7CtMo9B8Tvv1Z5vlk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cpIC1dv6RObP9UA+0I8I4WbuZMIfJR5hIqdMcNHrMPNjQNGL5CmapUB7sw5Zb1J2j
	 cclvW9+LqkwMVRWKe8lhRth//DA5btXHe0TnQWbixH1ZsoZh60I7wSB4QKXuH5uN0F
	 SJLiuxgS/dhiM7o+RzRaZQhPT/0fZgG+Y03Scdqs=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id A74251A3FFE;
	Mon,  1 Apr 2024 20:27:22 -0400 (EDT)
Message-ID: <67838089f740b7022106fccfae907843b02ec376.camel@xry111.site>
Subject: Re: [PATCHv3 pci-next 1/2] PCI/AER: correctable error message as
 KERN_INFO
From: Xi Ruoyao <xry111@xry111.site>
To: Ethan Zhao <haifeng.zhao@linux.intel.com>, Bjorn Helgaas
	 <helgaas@kernel.org>
Date: Tue, 02 Apr 2024 08:27:19 +0800
In-Reply-To: <ac855191-1289-40f5-b910-fb9558d5df76@linux.intel.com>
References: <20240326211705.GA1497507@bhelgaas>
	 <ac855191-1289-40f5-b910-fb9558d5df76@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0 
MIME-Version: 1.0
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
Cc: rajatja@chromium.org, rajat.khandelwal@linux.intel.com, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2024-03-27 at 11:49 +0800, Ethan Zhao wrote:
> so, yup, basically, the signal integrity is not good enough.
> Though the function could work, its performance will be impacted.

FWIW I've replaced the motherboard and this is gone.  So it's likely a
signal integrity issue of the motherboard.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
