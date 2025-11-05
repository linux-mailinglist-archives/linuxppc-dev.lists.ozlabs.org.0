Return-Path: <linuxppc-dev+bounces-13807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1403C36304
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 15:58:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1pNg2nxhz3bW7;
	Thu,  6 Nov 2025 01:58:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1098:5b::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762354707;
	cv=none; b=e0Jk9fGizNrx8adBrd9WESPZ3gt8jzQyOin+7rRD1KuRS/lq0aSphecPeL9WsCPdHJMRShFL3bGPoxhR3V1tjztsVvJY1s7QXMjhlk3bxtMnWzcK6Og6hKygMvgH69mNXJD0Ubih+qyptD2YFPMgfb4ZeGPsBId17uQG+7RhtOQN564/AWwtIXkxoxHDAQ/M5055iHRhyaQm7f4Ag8dA/84mxhbGiKDC0AS3jacxyleY1C/FQeJ2ErQQsIuTo25x2o7RDTGf9QUwLYt2MbuVRTOVAEmew9ST4WQQ5zGYfm/EWj5UtCNKgml7vu2bklCOJukkbIeB4Er8+Ksj4WH7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762354707; c=relaxed/relaxed;
	bh=j+8lmcfXXp+njydpClU6nphHyEcjCaty8/2kZQYj9+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBhnohpmEJkO7U9dsD8QZWBNcD1XPLlAlLQsCjz7Oopiy9fFD1vDdWHiBRy2ruBOxCp6RtXwN3RwLlpP2gSC6+z0GK6Q1qFyTnwuQmGmF2R41P2r11ntp1fh+fBN7f45zbSCYVdBobpWuhgayUEM2edJOtmka9yrFYjv29ERf0e/C5l+SRwziYZlrUx8RAQ4I4TY0I+gApS6NhsAKTVmvRtKEpkidqDc3YHf3GDUaOq2cpAgKcMKr5BAABKXx3U3kveuoUfhpvFfZ61NAgKRQh6FYmDTL9bTZqyDA1JF7b3xfkpbW8aL1QOh7kaO/sHWsvMRTEOaBMEkI55DBSiBiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org; dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=JM6VIsvw; dkim-atps=neutral; spf=pass (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org) smtp.mailfrom=treblig.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=JM6VIsvw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1pNd31Nwz2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 01:58:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=j+8lmcfXXp+njydpClU6nphHyEcjCaty8/2kZQYj9+E=; b=JM6VIsvwqcE8eA2d
	RGoZizM7LrU2/c1pbjv4fPyhyPmNcCS+u9oEkJyXjNgN3CCUm/LvyXxU8CcwCNiH3KEtnDppamwkZ
	SNpncQlBCZLBhSrHX0u39GkDa1lunWV4bOMAMIspvUT/wlq92C72AtDlCh74hjK38cpZ3KyvBg9XG
	tVtswSKIdXa6RtKXw/Z3Roze/3Mzu+ZsdJszjeTJKhfmim1NoqA85sjBKcaRp+lc7cvrkiV7Rx7vC
	+ZHScghNqX3xVup1c5nofV6dtlOTPB9NxMS0F+/AENn+uK0xqK8RZbTacDbBFOfu+QfBXh5PDR3He
	/drijtdl2LsE01dXVw==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1vGexe-00000002CEf-1dvB;
	Wed, 05 Nov 2025 14:58:10 +0000
Date: Wed, 5 Nov 2025 14:58:10 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Finn Thain <fthain@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
Cc: Stan Johnson <userm57@yahoo.com>, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, sam@ravnborg.org,
	benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, rdunlap@infradead.org,
	Cedar Maxwell <cedarmaxwell@mac.com>
Subject: Re: QEMU limitations, was Re: [PATCH v4] powerpc: Use shared font
 data
Message-ID: <aQtmAjvkD9CzzIJH@gallifrey>
References: <20230825142754.1487900-1-linux@treblig.org>
 <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com>
 <aQeQYNANzlTqJZdR@gallifrey>
 <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org>
 <aQgJ95Y3pA-8GdbP@gallifrey>
 <797f0a13-350f-e26d-f1ef-876419e1c013@linux-m68k.org>
 <492c13c9-666c-9578-6c66-0eb8fefc93dc@linux-m68k.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <492c13c9-666c-9578-6c66-0eb8fefc93dc@linux-m68k.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 14:56:52 up 9 days, 14:33,  3 users,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

(Copying Mark Cave-Ayland in - see below)

* Finn Thain (fthain@linux-m68k.org) wrote:
> 
> On Mon, 3 Nov 2025, Finn Thain wrote:
> 
> > > OK, remember I don't think I've ever tried PPC via MacOS booting, so 
> > > not familiar with it.
> > > 
> > 
> > I will try to set up a MacOS guest in QEMU, to see if the hang can be 
> > reproduced that way.
> > 
> 
> QEMU appears to be incompatible with the Old World ROM from the Beige G3. 
> 'qemu-system-ppc -M g3beige -bios 78F57389.ROM -serial stdio' drops into a 
> ROM diagnostic menu and won't boot.
> 
> I did get 'qemu-system-ppc -M mac99 ...' to boot into MacOS 9, by using 
> OpenBIOS instead of Apple firmware. Unforunately, BootX is not compatible 
> with this configuration, so it won't help.
> 
> BootX is compatible with beige powermacs, but 'qemu-system-ppc -M g3beige' 
> with OpenBIOS fails to boot MacOS 9 ("MacOS: unable to find an interrupt 
> controller node").
> 
> OpenBIOS wouldn't boot a MacOS 8.1 CD-ROM either, but for different 
> reasons: both mac99 and g3beige failed with "No valid state has been set 
> by load or init-program".

Thanks for trying,

I've copied Mark Cave-Ayland from Qemu in; he's down as the g3beige
maintainer in qemu, he might have a hint.

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

