Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A458ED83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 15:58:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468SjD3HdhzDr85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 23:58:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="coQw34U2"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Sfn1C8ZzDr3k
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 23:56:32 +1000 (AEST)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AA9C2054F;
 Thu, 15 Aug 2019 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565877388;
 bh=CnJg9LZZGs9THibQR2dsormIZNpKhFu2dcMp1+3B9Gk=;
 h=Date:From:To:To:To:To:Cc:Cc:Subject:In-Reply-To:References:From;
 b=coQw34U22sGODze8W55emGdMov53jEtSpepu0tSFQKgykT/grOp6CqKsFBUZtCK2b
 dQQtriXKL2STu8c8JRT1XSM2DB17Z++CHkiNbpqdwBTM9Wrd5sGYl8INVZ+ZrRPDsk
 FFKgtch8b0+BrWlgllWmG54/nHknEj8QZxJmZpTM=
Date: Thu, 15 Aug 2019 13:56:27 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Santosh Sivaraj <santosh@fossix.org>
To: Balbir Singh <bsingharora@gmail.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
Subject: Re: [PATCH v10 2/7] powerpc/mce: Fix MCE handling for huge pages
In-Reply-To: <20190815003941.18655-3-santosh@fossix.org>
References: <20190815003941.18655-3-santosh@fossix.org>
Message-Id: <20190815135628.3AA9C2054F@mail.kernel.org>
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
Cc: , "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: ba41e1e1ccb9 powerpc/mce: Hookup derror (load/store) UE errors.

The bot has tested the following trees: v5.2.8, v4.19.66.

v5.2.8: Build OK!
v4.19.66: Failed to apply! Possible dependencies:
    360cae313702 ("KVM: PPC: Book3S HV: Nested guest entry via hypercall")
    41f4e631daf8 ("KVM: PPC: Book3S HV: Extract PMU save/restore operations as C-callable functions")
    884dfb722db8 ("KVM: PPC: Book3S HV: Simplify machine check handling")
    89329c0be8bd ("KVM: PPC: Book3S HV: Clear partition table entry on vm teardown")
    8e3f5fc1045d ("KVM: PPC: Book3S HV: Framework and hcall stubs for nested virtualization")
    95a6432ce903 ("KVM: PPC: Book3S HV: Streamlined guest entry/exit path on P9 for radix guests")
    a43c1590426c ("powerpc/pseries: Flush SLB contents on SLB MCE errors.")
    c05772018491 ("powerpc/64s: Better printing of machine check info for guest MCEs")
    d24ea8a7336a ("KVM: PPC: Book3S: Simplify external interrupt handling")
    df709a296ef7 ("KVM: PPC: Book3S HV: Simplify real-mode interrupt handling")
    f7035ce9f1df ("KVM: PPC: Book3S HV: Move interrupt delivery on guest entry to C code")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

--
Thanks,
Sasha
