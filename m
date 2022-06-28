Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB4C55C0B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 13:32:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXMrn1kn4z3c8q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 21:32:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S9ev2a8N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S9ev2a8N;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXMr92QLcz3bq3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 21:31:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 60800B81B97
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 11:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3CFC341CD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 11:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656415908;
	bh=mGQ17FxEruXP1Se/YhPh1NXTTafvPHopAQxVYAQOAng=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S9ev2a8N8YQmk0FkOdWFCB7fzksaF3TDIqbfcHvGcwSqAPQBjVarw4vw9M3l6HHmL
	 ssCxgmsI8FHt9fG0XtnHdMUgr0QiYRCSQ79IVVpF+/C1G6eLSjq//dde0lc2VRCRaS
	 1FOEBaNxnclo7b2FYkWs82psE+DIlzk94a+i0CS0kc4yOVpaZiit6FGLCMgT4MtfTp
	 CwGZaSPgvhkEFi/ozVYkEbtrBOACwSSrasTZCqcPAk1+8mx2bwdjGw8Jo6F9FVGxwT
	 aWToqKSq2ntJ+svOn8tdm9iL+aJ6hyyGwGM/YXBZrhOMDyTMuQVPNXGFsy/i9skP/1
	 Bv9FMX2w5oSmA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2ef5380669cso113475717b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 04:31:48 -0700 (PDT)
X-Gm-Message-State: AJIora+BGbKM7oUT2Hw61viqPeUaFF1dOceVFjV3igOkrGjMdeh+nSD0
	pLS6BxHH7wmBHC6aMc1XqIRQOmq88vr66tHzhJM=
X-Google-Smtp-Source: AGRyM1u6alRW6DNpLAw2CjiZONF/08UESoBCXDxfJxZHbJGIZ8WIqxSBVa0RkxHHh4KQrTbwBfw484vqcSO7R67ID6s=
X-Received: by 2002:a81:230c:0:b0:31b:f368:d0b0 with SMTP id
 j12-20020a81230c000000b0031bf368d0b0mr4904055ywj.249.1656415907046; Tue, 28
 Jun 2022 04:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220624155226.2889613-1-arnd@kernel.org> <yq1bkudh4va.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1bkudh4va.fsf@ca-mkp.ca.oracle.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Jun 2022 13:31:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3-D_Ct1jBpKzv7OPZ3Mfkx4iD1QG8ELuib02aGXUAS6A@mail.gmail.com>
Message-ID: <CAK8P3a3-D_Ct1jBpKzv7OPZ3Mfkx4iD1QG8ELuib02aGXUAS6A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] phase out CONFIG_VIRT_TO_BUS
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Miquel van Smoorenburg <mikevs@xs4all.net>, linux-scsi <linux-scsi@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Matt Wang <wwentao@vmware.com>, Parisc List <linux-parisc@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 28, 2022 at 4:59 AM Martin K. Petersen
<martin.petersen@oracle.com> wrote:
> Hi Arnd!
>
> > If there are no more issues identified with this series, I'll merge it
> > through the asm-generic tree. The SCSI patches can also get merged
> > separately through the SCSI maintainers' tree if they prefer.
>
> I put patches 1 and 2 in scsi-staging to see if anything breaks...

Ok, thanks!

I have just the third patch in the asm-generic tree now. As long as it all
make it into the merge window, this should work out fine without build
issues, though there is a small bisection window during which the buslogic
driver becomes hidden. I think that's ok here.

       Arnd
