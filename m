Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 484F228D611
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 23:00:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9nxv4dxJzDqgP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 08:00:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=BL+zK0lz; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9nw64zFZzDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 07:59:02 +1100 (AEDT)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57AD620878;
 Tue, 13 Oct 2020 20:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602622739;
 bh=LBtRmpzbTHp9NFKCOBgUHz5pM1wIf4PakEUrUA0pucs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BL+zK0lzFyOro1XILCI/FUV95to++ADhTHWGrLCUpkL0rleELizdVs8AdiqZqPVAk
 lt0r46HRelSMF7oqA+80HhIAXklH6M3Y7CazZzMTrwnakVh5ObY3g2akRTqvoeJX8x
 Zsc/BgoCJEYtDXCRnIQYo5LgJfLTfWVKZhYxTu9Y=
Date: Tue, 13 Oct 2020 13:58:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
Message-Id: <20201013135858.f4a7f0c5f3b0a69a2a304cfe@linux-foundation.org>
In-Reply-To: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  2 Sep 2020 17:12:09 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> This patch series includes fixes for debug_vm_pgtable test code so that
> they follow page table updates rules correctly. The first two patches introduce
> changes w.r.t ppc64. The patches are included in this series for completeness. We can
> merge them via ppc64 tree if required.

Do you think this series is ready to be merged?

Possibly-unresolved issues which I have recorded are

Against
mm-debug_vm_pgtable-locks-move-non-page-table-modifying-test-together.patch:

https://lkml.kernel.org/r/56830efb-887e-0000-a46e-ae015e5854cd@arm.com
https://lkml.kernel.org/r/20200910075752.GC26874@shao2-debian

Against mm-debug_vm_pgtable-avoid-none-pte-in-pte_clear_test.patch:

https://lkml.kernel.org/r/87zh5wx51b.fsf@linux.ibm.com
https://lkml.kernel.org/r/37a9facc-ca36-290f-3748-16c4a7a778fa@arm.com
https://lkml.kernel.org/r/20201011200258.GA91021@roeck-us.net
