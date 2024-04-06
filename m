Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E804889A89E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 05:20:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ooTiwkUK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VBLGB5MsQz3vdR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 14:20:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ooTiwkUK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=103.168.172.150; helo=fout7-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VBLFR00hkz3dVp
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 14:19:52 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id AB0F913800C6;
	Fri,  5 Apr 2024 23:19:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 05 Apr 2024 23:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712373588; x=1712459988; bh=9kul5wYSciMTZEU/ffUWZ8gwme9H
	jWu3Wnb8YIqDLsk=; b=ooTiwkUKPhqW9zfzDZVT3t/TwKbGTeukyQ4L0eHI7FMv
	fu2q2wSYhfbk2jjYyI79BJ9vJ5UB4/FWTSOjn12RWZ/kxPypStmk6egXL5gHeDok
	Iocho1g/7BznBTiKa5E4QQVq+pXilIyNR5+Ijbxp4QN0RAqt0E8sTNM23+ZSF7Ra
	ojM7WTN9HlJPvg01UFgme3wy3+WzWBYQXSOCuVBejHua7G9sefeUdklA9Dld3i9+
	7x4WzRhlxgXoysfUO+r2ms3FKpTumVIOY+eYv1ZvNnAxCuXE2ofJMCZNc6fwajWj
	CePqWoYYYT/OXE3GQI8GbkBa80qBAmFs0Hv6+M1Qfw==
X-ME-Sender: <xms:Ur8QZuD8CT1UgC2Ds_aeWUmZvG7k3rQ_eX6fvm6SCS3sviG2kXOL1Q>
    <xme:Ur8QZogH6Jyrkz30kjfkMt-_EmsjoqVYpN1lphw-cgCMiruvqWvzxtId2lyx6l8JU
    rpJCQKR6aVGCqvyrQI>
X-ME-Received: <xmr:Ur8QZhm9Tx7fRhWNb6GpVtDOu2okZdG2SZjuYn9I-NI03ZJvLu2MNDfLtmCvWzJKSlDgIoqFANhKgnoRh1rTREAmL4UVNJgj27w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeguddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:Ur8QZsxlx9GVIg02xww6XF9wTSF1HVYFdDDg3IL3dCX74TB4rf7cfw>
    <xmx:Ur8QZjRkr3MDJRNQqfySKoKF3SnOkXjUIMk2DyozNbelevevHUqjqQ>
    <xmx:Ur8QZnb-is7g2j0VuIVznGeNBrxJmDGGRbQUGGw_GUDkpPlCOhysHQ>
    <xmx:Ur8QZsTtMS3xpqUGF7dxI1A7sGSSaN1Rqs6qLMD9_kErmZGlU6GRuA>
    <xmx:VL8QZhBxeJD7YIEcwdZTCg1evymGUe6vlmyeyGzewfTlaE1QTvbhybbU>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Apr 2024 23:19:44 -0400 (EDT)
Date: Sat, 6 Apr 2024 14:21:33 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] serial/pmac_zilog: Remove flawed mitigation for rx
 irq flood
In-Reply-To: <87v84w7be3.fsf@mail.lhotse>
Message-ID: <2cb53463-897b-8f3f-7238-9fe87622b54d@linux-m68k.org>
References: <0df45bedded1249f6c6ec2c2fb0d9879da1841b7.1712273040.git.fthain@linux-m68k.org> <87v84w7be3.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 5 Apr 2024, Michael Ellerman wrote:

> I assume you have tested this on an actual pmac, as well as qemu?
> 

I tested the patched driver and its console functionality using Zilog SCC 
hardware in a Mac IIci, as well as QEMU's q800 virtual machine.

That should suffice from a code coverage point-of-view, since 
pmz_receive_chars() is portable and independent of CONFIG_PPC_PMAC.

Moreover, I don't know how to get my PowerMac G3 to execute the kludge 
that's to be removed here. I can't prove it's impossible, though.
