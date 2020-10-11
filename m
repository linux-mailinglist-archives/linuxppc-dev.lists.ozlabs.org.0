Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0692328AA0E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Oct 2020 22:04:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8XpJ2fH9zDqs2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 07:04:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c43;
 helo=mail-oo1-xc43.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VgT/nWtf; dkim-atps=neutral
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8XmT07sDzDqqD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 07:03:04 +1100 (AEDT)
Received: by mail-oo1-xc43.google.com with SMTP id c10so229262oon.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Oct 2020 13:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=32meTpfUtWaR0Qq1/bwY0Ndf2COTimexjjPCdFogtfE=;
 b=VgT/nWtfnjojQR/tIQUFEqsHBZta/9Rwj6zyOS4VuiqoywN7it+DajLOqcsIu7j4G1
 6/spCpcVy6aFOwf0qIG2n4GhAEKW6gxfPEuq/Q/v8ZVXke/iSgFArrykJIQZ3vvuejk9
 2gXlPIFRFZ8Uy751TlXJHDYbZjfTx4KoF+s/reSx6SEGY83HLRaQo/rF4R3gX+/4KcCN
 fRMTkmj5aSwIfk2pu+cnZ5ru0Om33jivzo6Wgfb7A8fSRzd8jKwmNMr197oFtHWYZDVj
 nN3osQb/lkRiQObbRvKLcY2WH5LP6BDGOpUubhoYljTG0+1mBBSXuZLFb8H9nPDttUfB
 elNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=32meTpfUtWaR0Qq1/bwY0Ndf2COTimexjjPCdFogtfE=;
 b=RZmWjcEUe6JrYivLD5k+NQ070t3wsvgER0Nr9OlPSWiCnUOKzxhoTTHKJAJikabfFx
 97SA4PJd77hOwxMfzhj348fPrqCo188FwM5hlFN6c1t8gy+V82MUAcPNN2U170M9PAf9
 KRiBniORP2QYXPjFkiP4hVCCv6N/26895z6+YsbgRhPM3EutCf/e2FBrstIPhwUKCYYX
 YuVDc3Mpn/QBDWKVdVN1ISNqWubBfPr3ILzJ3PvoxOSPMCIMZvb4un8FpicH6FwSIjqK
 m7/oXsB8Pht1q+/iQnqJeLT6Y+Yw9sLKlRNyctToScQKTTNLODSq5l4mWiCsR2ycWp3X
 9FAQ==
X-Gm-Message-State: AOAM532WosY/1TpzkuJiDJK3mK+HIErxlsd9bKMQlxCuMTHj+5axDWYl
 ufd0JylIfCNpVTiq06d1b10=
X-Google-Smtp-Source: ABdhPJytsfVAwgPeX1X8d22eJs0RZ/tPyGMJh8rwcc3ivJvoWusoN4Lhh3OJ1s5LJ8BI6k3IknrpMQ==
X-Received: by 2002:a4a:3b91:: with SMTP id s139mr16212015oos.34.1602446580609; 
 Sun, 11 Oct 2020 13:03:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id n12sm7812086oor.7.2020.10.11.13.02.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 11 Oct 2020 13:02:59 -0700 (PDT)
Date: Sun, 11 Oct 2020 13:02:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 13/13] mm/debug_vm_pgtable: Avoid none pte in
 pte_clear_test
Message-ID: <20201011200258.GA91021@roeck-us.net>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <20200902114222.181353-14-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902114222.181353-14-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 02, 2020 at 05:12:22PM +0530, Aneesh Kumar K.V wrote:
> pte_clear_tests operate on an existing pte entry. Make sure that
> is not a none pte entry.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

This patch causes all riscv64 images to crash. Reverting it
as well as the follow-up patch fixes the problem, but there are
still several warning messages starting with
	BUG kmem_cache (Not tainted): Freechain corrupt
I did not try to track down this other problem.

A detailed crash log is at
	https://kerneltests.org/builders/qemu-riscv64-next/builds/523/steps/qemubuildcommand/logs/stdio

Bisect log is attached.

Guenter

---
# bad: [d67bc7812221606e1886620a357b13f906814af7] Add linux-next specific files for 20201009
# good: [549738f15da0e5a00275977623be199fbbf7df50] Linux 5.9-rc8
git bisect start 'HEAD' 'v5.9-rc8'
# good: [b71be15b496cc71a3434a198fc1a1b9e08af6c57] Merge remote-tracking branch 'bpf-next/master' into master
git bisect good b71be15b496cc71a3434a198fc1a1b9e08af6c57
# good: [3542e5a87341bdca83e3d7f061b0f4e0f4c23f73] Merge remote-tracking branch 'spi/for-next' into master
git bisect good 3542e5a87341bdca83e3d7f061b0f4e0f4c23f73
# good: [65f9c957115c749ba79fb469083caf14101a93bb] Merge remote-tracking branch 'char-misc/char-misc-next' into master
git bisect good 65f9c957115c749ba79fb469083caf14101a93bb
# good: [aadfe5ecb55641d5994a5f3b27f074beead8f49b] Merge remote-tracking branch 'scsi-mkp/for-next' into master
git bisect good aadfe5ecb55641d5994a5f3b27f074beead8f49b
# good: [060196553d119d5c252f09ed5b0316929cc25983] Merge remote-tracking branch 'memblock/for-next' into master
git bisect good 060196553d119d5c252f09ed5b0316929cc25983
# bad: [d2340d89ffa6d2643f0689600dbf0969d86fdd3c] x86/setup: simplify initrd relocation and reservation
git bisect bad d2340d89ffa6d2643f0689600dbf0969d86fdd3c
# bad: [4b23734f5ba1a0487b2b569a9e64e4e5360009c1] mm/swapfile.c: remove unnecessary goto out in _swap_info_get()
git bisect bad 4b23734f5ba1a0487b2b569a9e64e4e5360009c1
# good: [b30f5277e97be65a99ca5af3d4337cb9acbf8fa7] device-dax: introduce 'struct dev_dax' typed-driver operations
git bisect good b30f5277e97be65a99ca5af3d4337cb9acbf8fa7
# good: [8c2075296dbbbce685fa14bbf46d29fba54f8a62] mm/debug_vm_pgtable: drop hugetlb_advanced_tests()
git bisect good 8c2075296dbbbce685fa14bbf46d29fba54f8a62
# bad: [52ce97889b3c85826995d22a690cd1430c14f316] mm/filemap: fix filemap_map_pages for THP
git bisect bad 52ce97889b3c85826995d22a690cd1430c14f316
# bad: [1ddc0b707be99faece6cdd77f34544f408c6617d] proc: optimise smaps for shmem entries
git bisect bad 1ddc0b707be99faece6cdd77f34544f408c6617d
# bad: [5d685be3785638202430b6baa2ecde482b52c41e] mm: factor find_get_incore_page out of mincore_page
git bisect bad 5d685be3785638202430b6baa2ecde482b52c41e
# bad: [0797f84d689b9f1e7256d954280b28bfeaf5b1fc] mm/debug_vm_pgtable: avoid doing memory allocation with pgtable_t mapped.
git bisect bad 0797f84d689b9f1e7256d954280b28bfeaf5b1fc
# bad: [4f9a78e6bcd60a25b187adc1526ab3815fc40dae] mm/debug_vm_pgtable: avoid none pte in pte_clear_test
git bisect bad 4f9a78e6bcd60a25b187adc1526ab3815fc40dae
# first bad commit: [4f9a78e6bcd60a25b187adc1526ab3815fc40dae] mm/debug_vm_pgtable: avoid none pte in pte_clear_test
