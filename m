Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A35433DCE33
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 01:49:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdHsm1tgdz3bZ9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 09:49:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MAY40Hmj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MAY40Hmj; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdHsF4fflz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 09:48:47 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 605055C00B3;
 Sun,  1 Aug 2021 19:48:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 01 Aug 2021 19:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nnnzJF
 x8hthSPnZMbL1LXaiksssikZRREo9X40HfJyo=; b=MAY40HmjmS/AFI4yvUYgWJ
 k02rfMQIDrmctCPmAdjUet8n60RblLqZivAYJiJVUIfeIQU8yIN8N1OzS6vSjupH
 dOrzAlvGPyeTrE9+0L1R49w6lDrF0LVM0VtSyx24BW9/aDahFahlJFbUrPCspGjr
 i0KjDqC++QugdpN8UF5SopFcmPivGYpzL8tXQ+z/gtWH10ZyjKeyPD41XnDniBS9
 YwLr8IAbshAdrpIvK8mZtKxaJJQUws/OkTpxceJhixSw1lWeZtbfGAjN+Tc1bM/6
 OrzbjdvPIjKzDiCJB9YUSEejMi5omEq4oraIzZYmhIXYKu1Bl8K0cGI+mjAnV4YA
 ==
X-ME-Sender: <xms:2jIHYR4VukHQvaZRDZNdiAE1020L2RRf6-9biPVhQ79iWE2WNd0krA>
 <xme:2jIHYe4N0u6KgPYhtI9fVNFOU098q49fsLp5b4AqBpmN_5HNdapqIu7cC3Sb56olz
 ml4BXturuRsNxuiwxU>
X-ME-Received: <xmr:2jIHYYcavJpf89ph2CSar3Zkc0Rufr6fiCNApBQ7XH7JqfjQXl4Jsx8oZO_PEQsfHN-waltg0yKNYycEZWaXyONgS8V3hjCyQ58>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddriedugddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeffudfhgeefvdeitedugfelueegheekkeefveffhfeiveetledvhfdtveffteeu
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
 hhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:2jIHYaIBRK2WXKB3yeJ3CBZy7zrvlciftgUR9rzH5yt0ZsUCSW0tPw>
 <xmx:2jIHYVICCBnp8zRjbTHWsG52CbY9Nr_H6xERWEq8qwM1aw_ubA7rlA>
 <xmx:2jIHYTxF_ZohcMKbfrc7iuvZE5MH3YU3oX37CVp3dhD5VLtmKIh93w>
 <xmx:2zIHYThhXzBUL1gRcSZmIeOPGnH4ufY0SwaKaWQXCryA6hWcdIKbdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Aug 2021 19:48:39 -0400 (EDT)
Date: Mon, 2 Aug 2021 09:48:36 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Stan Johnson <userm57@yahoo.com>
Subject: Re: [PATCH v3 31/41] powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
In-Reply-To: <34e52975-4ab9-4eb4-3501-02376e38a27c@yahoo.com>
Message-ID: <3e4365d3-e58e-ee89-2da4-f79926db15bd@linux-m68k.org>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
 <ca5795d04a220586b7037dbbbe6951dfa9e768eb.1615552867.git.christophe.leroy@csgroup.eu>
 <666e3ab4-372-27c2-4621-7cc3933756dd@linux-m68k.org>
 <20210731173954.Horde.fV2Xkw7-sxjG0DUcZ_JO_g3@messagerie.c-s.fr>
 <1d601b7c-1e39-e372-39a5-e1e98e56e2a5@linux-m68k.org>
 <34e52975-4ab9-4eb4-3501-02376e38a27c@yahoo.com>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Nick Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 1 Aug 2021, Stan Johnson wrote:

> > 
> >> Could you try without CONFIG_VMAP_STACK
> >>
> > 
> > Stan, would you please test the following build:
> > 
> > $ git checkout v5.13
> > $ cp ../dot-config-powermac-5.13 .config
> > $ scripts/config -d CONFIG_VMAP_STACK
> > $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean olddefconfig vmlinux
> > 
> Please see the attached serial console log (four boots):
> 1) v5.13-mac, CONFIG_VMAP_STACK=y, mem=512M (fails)
> 2) v5.13-mac, CONFIG_VMAP_STACK=y, mem=384M (works)
> 3) v5.13-mac, CONFIG_VMAP_STACK=n, mem=512M (works)
> 4) v5.13-mac, CONFIG_VMAP_STACK=n, mem=384M (works)
> 
> My apologies if the extra boots were not needed (due to the time
> difference, I'm trying to anticipate future requests).
> 
> Cutting and pasting Finn's commands above builds a new kernel
> (5.13.0-pmac) with the following in .config:
> 
> $ fgrep VMAP .config
> CONFIG_HAVE_ARCH_VMAP_STACK=y
> CONFIG_VMAP_STACK=y
> 

That's odd. It works correctly here:

$ cp ../dot-config-powermac-5.13 .config
$ grep CONFIG_VMAP_STACK .config
CONFIG_VMAP_STACK=y
$ scripts/config -d CONFIG_VMAP_STACK
$ grep CONFIG_VMAP_STACK .config
# CONFIG_VMAP_STACK is not set

Anyway, I see that you resolved the problem:

> ...
> 
> $ fgrep VMAP .config
> CONFIG_HAVE_ARCH_VMAP_STACK=y
> # CONFIG_VMAP_STACK is not set
> 
> 3) Same as 1 (512M) but with CONFIG_VMAP_STACK not set in v5.13.
> Everything works (no problems with X, no errors logged).
> 
> 4) Same as 2 (384M) but with CONFIG_VMAP_STACK not set in v5.13.
> Everything works (no problems with X, no errors logged).
> 

Thanks for collecting those results.

It appears that Christophe was right. Disabling CONFIG_VMAP_STACK avoids 
the crashes in v5.13. (Enabling CONFIG_VMAP_STACK worked fine in v5.12.)
