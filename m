Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2071CB505F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 16:30:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xlr80gqQzF1Rv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 00:30:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="etm9OSEb"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xlkn3MTNzF3kZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 00:25:14 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id f21so52924otl.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4KYgCoihQtHpObs6KwiRjY2Y2fiuMxgk3xzU6sph3Lg=;
 b=etm9OSEbo9YQ8P8RZtR9HZEQ098klnBTG4PUlJY5tTEArq/1Sp1jFMAQ8gt/PT7FRy
 lm8jEzNQClotg3vr5I2lBHv9FzggDp/3uXOPNrQEqAOHPLxgCNA+qTM2+W6Z3XlnICan
 QFCrxI8FglNZF8JlaTBpBO3kEsMWb6bej3yKcY4I1RqtLJjDUZtEDBuEiPBGci0FW/Gt
 BzWg1FZzhUH7nbW0V6D1yz0dDuyNyzD2kP8Gu8Mthplml8T/xjjdKaZ+gD8AYdDifsfy
 rOYw/rVdlbQnq3SUWVY3C1Ru9zYXplgqBuZ7db1df3/jI3m7uu9FujHgram6fbLcAQ6K
 VqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4KYgCoihQtHpObs6KwiRjY2Y2fiuMxgk3xzU6sph3Lg=;
 b=seJWCWauV3BtrpC/8gUAV9oJozxcGe6a3wHoKoIJCmw5QNLIRGXRtAH5jDeygbBVJQ
 6zET3HnbA7cbz4BZFfrLiu1CfxOUdU5wZ/9tQlA+S/vRgmmHa3KOR5g+NiSaZLQxv6RT
 mN6RxZ0EtP9cjZg8YwAVPnntnP34Cp9BAyqaohLAlokjWKBJDUm9SVn78BrjCiQxi+Sr
 T9bxVZ9t8icPhvjhuwXO7lGIDWZlMofKgmn3P//pi0r779aovT1OL9QVQOxLuaiT9g9/
 42q3ZkAwqQY+nTCWaizAHtaRbc4z2PM1Qqq/xTHByB3CbOdoWV2CdVCzKnxynGerZEvu
 U7Eg==
X-Gm-Message-State: APjAAAXPHtcaAYPGjbJJINh51nFeRyYWHEsne8S5sTpvx/N4+I6gqrri
 kmsjF1zU7S7JHkAZ0Fh5mOqiNm842akjopMW4bgFiw==
X-Google-Smtp-Source: APXvYqyh1dxWBp9hrX3NuNgioFNleHOrVodwlLmsbqnqyq3vaXajMZrNNKPRuNFUBp/dq8PWpu8mMeWeZ2BMzj6P+ck=
X-Received: by 2002:a9d:2642:: with SMTP id a60mr2737784otb.247.1568730311407; 
 Tue, 17 Sep 2019 07:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4g2jAGzQ3fxpZRTV16hoPfyXqzvB7Zny6D5g5JyAQ1Dkw@mail.gmail.com>
 <94cff17c-bdf7-0395-bf5a-e2d72ca61893@linux.ibm.com>
In-Reply-To: <94cff17c-bdf7-0395-bf5a-e2d72ca61893@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 17 Sep 2019 07:24:58 -0700
Message-ID: <CAPcyv4iWaKj_+5L7GY32DEmBB-77yvimZG_r8TCc1AETQc68vg@mail.gmail.com>
Subject: Re: [PATCH 1/2] libnvdimm/altmap: Track namespace boundaries in altmap
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 17, 2019 at 12:40 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 9/16/19 11:28 PM, Dan Williams wrote:
> > On Mon, Sep 9, 2019 at 11:29 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> With PFN_MODE_PMEM namespace, the memmap area is allocated from the device
> >> area. Some architectures map the memmap area with large page size. On
> >> architectures like ppc64, 16MB page for memap mapping can map 262144 pfns.
> >> This maps a namespace size of 16G.
> >>
> >> When populating memmap region with 16MB page from the device area,
> >> make sure the allocated space is not used to map resources outside this
> >> namespace. Such usage of device area will prevent a namespace destroy.
> >>
> >> Add resource end pnf in altmap and use that to check if the memmap area
> >> allocation can map pfn outside the namespace. On ppc64 in such case we fallback
> >> to allocation from memory.
> >>
> >> This fix kernel crash reported below:
> >>
> >> [  132.034989] WARNING: CPU: 13 PID: 13719 at mm/memremap.c:133 devm_memremap_pages_release+0x2d8/0x2e0
> >> [  133.464754] BUG: Unable to handle kernel data access at 0xc00c00010b204000
> >> [  133.464760] Faulting instruction address: 0xc00000000007580c
> >> [  133.464766] Oops: Kernel access of bad area, sig: 11 [#1]
> >> [  133.464771] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> >> .....
> >> [  133.464901] NIP [c00000000007580c] vmemmap_free+0x2ac/0x3d0
> >> [  133.464906] LR [c0000000000757f8] vmemmap_free+0x298/0x3d0
> >> [  133.464910] Call Trace:
> >> [  133.464914] [c000007cbfd0f7b0] [c0000000000757f8] vmemmap_free+0x298/0x3d0 (unreliable)
> >> [  133.464921] [c000007cbfd0f8d0] [c000000000370a44] section_deactivate+0x1a4/0x240
> >> [  133.464928] [c000007cbfd0f980] [c000000000386270] __remove_pages+0x3a0/0x590
> >> [  133.464935] [c000007cbfd0fa50] [c000000000074158] arch_remove_memory+0x88/0x160
> >> [  133.464942] [c000007cbfd0fae0] [c0000000003be8c0] devm_memremap_pages_release+0x150/0x2e0
> >> [  133.464949] [c000007cbfd0fb70] [c000000000738ea0] devm_action_release+0x30/0x50
> >> [  133.464955] [c000007cbfd0fb90] [c00000000073a5a4] release_nodes+0x344/0x400
> >> [  133.464961] [c000007cbfd0fc40] [c00000000073378c] device_release_driver_internal+0x15c/0x250
> >> [  133.464968] [c000007cbfd0fc80] [c00000000072fd14] unbind_store+0x104/0x110
> >> [  133.464973] [c000007cbfd0fcd0] [c00000000072ee24] drv_attr_store+0x44/0x70
> >> [  133.464981] [c000007cbfd0fcf0] [c0000000004a32bc] sysfs_kf_write+0x6c/0xa0
> >> [  133.464987] [c000007cbfd0fd10] [c0000000004a1dfc] kernfs_fop_write+0x17c/0x250
> >> [  133.464993] [c000007cbfd0fd60] [c0000000003c348c] __vfs_write+0x3c/0x70
> >> [  133.464999] [c000007cbfd0fd80] [c0000000003c75d0] vfs_write+0xd0/0x250
> >
> > Question, does this crash only happen when the namespace is not 16MB
> > aligned? In other words was this bug exposed by the subsection-hotplug
> > changes and should it contain Fixes: tag for those commits?
> >
>
> We are able to hit this crash even with older kernels. This happens when
> we have multiple namespaces from the same region of size 26G. In that
> case we need to make sure we don't end up using altmap from one
> namespace for mapping vmemmap of the adjacent namespace.
>
> Considering this impacts ppc64 and we got the ppc64 SCM support in 4.20.
> may be  we can do just
> Cc: <stable@vger.kernel.org> # 4.20+

Ok, thanks!
