Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA145B3FE6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 20:01:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XDZ51WRDzF3XH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 04:01:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="X6PKCigr"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XDWb6pB6zF1qt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 03:58:51 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id h17so648907otn.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 10:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZBfYJ19Paf/hLNb6Ye+v7jwhGQnHf20AdY/r84fczKU=;
 b=X6PKCigrLZVQCT1SP1gKVoiux5EZZKkTQj12/WROSndrvqr//HdL312ewutOhqJa88
 jkSjVvdpMOeRtXnNEEGfzUj682H0ZmpXYakGVRHCeY1ceddIQo77hO5KjjJP73fQ0e42
 HTXz9uuCKFJ440fC2CkILfkOOxAZL7RukPnCeTC0N3KJjVd1U7Lq5yi63ppcv6okwTWZ
 b2Rz4OBPUjaTVYBGJb2qPPzRcxYu9oHDFhgDlUnoj90AesEAhmYB6so0O9S0AFNVZwjN
 mI3PIxVPe9NcA4aINs/FCDbO6ubqumJ+HDpPWSdvlBm9xHq9YPQa93nL6RZwVYukz0at
 vTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZBfYJ19Paf/hLNb6Ye+v7jwhGQnHf20AdY/r84fczKU=;
 b=jZD5oUICu0sJ6fOibAEoZx0nT6G/Zs5jQ80tR7cHA8FNouPnM2Nt1Ff+Ui6zC7OPQC
 +JPKdugTo7RtGHoY/ZCxbZTEeJk5maG95IpCXavTBhlUPEC+PQRbGiuMP4Td5OG2NOAH
 bTn4dsh9cIwAhMuXMMlhBJtjoPt/MRcQZ2iQ67E2Te1OhHuErJc362VU8lMiM4Sjd6Mi
 ZkCUNR947iY1MFRosqY9KOoE4tie21u2q0O2doIIHtXhtWqw88IoKZ/UkWORR4taI+Ip
 OUc8mCCGp1lkLcofayPtln9/SxbMOeFc+DLn4tnHYkQA6c/7QdbbfmzSoby2/AhJBrT7
 TIKg==
X-Gm-Message-State: APjAAAUfBJmNK5w3yrbGFBL+I5fEriw3G4Eq10bCU7WhNMMxmNFSKULx
 R0L2tqyQlVEG4OeIvBbEfRZ9JyFa7xqrNgAXalPZuA==
X-Google-Smtp-Source: APXvYqzl+/Oe+SRra63pGxDCtiBTcyBjkrohjtozYl23XPCexO8fRxaxITWvLOiewMLUwPLPIcQcK4eZ0yf2bh7fVHs=
X-Received: by 2002:a9d:3a6:: with SMTP id f35mr301938otf.363.1568656727910;
 Mon, 16 Sep 2019 10:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 16 Sep 2019 10:58:36 -0700
Message-ID: <CAPcyv4g2jAGzQ3fxpZRTV16hoPfyXqzvB7Zny6D5g5JyAQ1Dkw@mail.gmail.com>
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

On Mon, Sep 9, 2019 at 11:29 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> With PFN_MODE_PMEM namespace, the memmap area is allocated from the device
> area. Some architectures map the memmap area with large page size. On
> architectures like ppc64, 16MB page for memap mapping can map 262144 pfns.
> This maps a namespace size of 16G.
>
> When populating memmap region with 16MB page from the device area,
> make sure the allocated space is not used to map resources outside this
> namespace. Such usage of device area will prevent a namespace destroy.
>
> Add resource end pnf in altmap and use that to check if the memmap area
> allocation can map pfn outside the namespace. On ppc64 in such case we fallback
> to allocation from memory.
>
> This fix kernel crash reported below:
>
> [  132.034989] WARNING: CPU: 13 PID: 13719 at mm/memremap.c:133 devm_memremap_pages_release+0x2d8/0x2e0
> [  133.464754] BUG: Unable to handle kernel data access at 0xc00c00010b204000
> [  133.464760] Faulting instruction address: 0xc00000000007580c
> [  133.464766] Oops: Kernel access of bad area, sig: 11 [#1]
> [  133.464771] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> .....
> [  133.464901] NIP [c00000000007580c] vmemmap_free+0x2ac/0x3d0
> [  133.464906] LR [c0000000000757f8] vmemmap_free+0x298/0x3d0
> [  133.464910] Call Trace:
> [  133.464914] [c000007cbfd0f7b0] [c0000000000757f8] vmemmap_free+0x298/0x3d0 (unreliable)
> [  133.464921] [c000007cbfd0f8d0] [c000000000370a44] section_deactivate+0x1a4/0x240
> [  133.464928] [c000007cbfd0f980] [c000000000386270] __remove_pages+0x3a0/0x590
> [  133.464935] [c000007cbfd0fa50] [c000000000074158] arch_remove_memory+0x88/0x160
> [  133.464942] [c000007cbfd0fae0] [c0000000003be8c0] devm_memremap_pages_release+0x150/0x2e0
> [  133.464949] [c000007cbfd0fb70] [c000000000738ea0] devm_action_release+0x30/0x50
> [  133.464955] [c000007cbfd0fb90] [c00000000073a5a4] release_nodes+0x344/0x400
> [  133.464961] [c000007cbfd0fc40] [c00000000073378c] device_release_driver_internal+0x15c/0x250
> [  133.464968] [c000007cbfd0fc80] [c00000000072fd14] unbind_store+0x104/0x110
> [  133.464973] [c000007cbfd0fcd0] [c00000000072ee24] drv_attr_store+0x44/0x70
> [  133.464981] [c000007cbfd0fcf0] [c0000000004a32bc] sysfs_kf_write+0x6c/0xa0
> [  133.464987] [c000007cbfd0fd10] [c0000000004a1dfc] kernfs_fop_write+0x17c/0x250
> [  133.464993] [c000007cbfd0fd60] [c0000000003c348c] __vfs_write+0x3c/0x70
> [  133.464999] [c000007cbfd0fd80] [c0000000003c75d0] vfs_write+0xd0/0x250

Question, does this crash only happen when the namespace is not 16MB
aligned? In other words was this bug exposed by the subsection-hotplug
changes and should it contain Fixes: tag for those commits?
