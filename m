Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE23F11AD95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 15:34:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xzwb1lqLzDql9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 01:34:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=r.bolshakov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="a1nb3G8T"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xzsr3vf9zDqjN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 01:32:31 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 676AA43C28;
 Wed, 11 Dec 2019 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-disposition:content-type:content-type:mime-version
 :message-id:subject:subject:from:from:date:date:received
 :received:received; s=mta-01; t=1576074746; x=1577889147; bh=nVO
 qV8JU6Q3WyFeaHtl8vLxQcuROtv7ljFj4/vjuHr0=; b=a1nb3G8TMP/w/dfVWZQ
 /s22B9680XRJxJhdxE0ZB3MZV2/fmYQBfPZu8HtKeGzSvWMGes02fRdjCPcbi4zr
 2GK6Vix3D1QrEgjZht03unt/5JqCwoh474oyr0Aj98J9V0A813kNT78IUtX1mRnG
 ScfHnelgrH1WjooYCHYMtzRE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rf9JQvE0n-R2; Wed, 11 Dec 2019 17:32:26 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D014F41200;
 Wed, 11 Dec 2019 17:32:25 +0300 (MSK)
Received: from localhost (172.17.128.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 11
 Dec 2019 17:32:25 +0300
Date: Wed, 11 Dec 2019 17:32:24 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: MODPOST warnings on ppc64le
Message-ID: <20191211143224.mxknpbtrrs2g5q6f@SPB-NB-133.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [172.17.128.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Mauricio Faria de Oliveira <mauricfo@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I'm seeing a set of build warnings on the 5.5-rc1 kernel:

WARNING: vmlinux.o(.text+0x31e4): Section mismatch in reference from the variable __boot_from_prom to the function .init.text:prom_init()
The function __boot_from_prom() references
the function __init prom_init().
This is often because __boot_from_prom lacks a __init
annotation or the annotation of prom_init is wrong.

WARNING: vmlinux.o(.text+0x33c8): Section mismatch in reference from the variable start_here_common to the function .init.text:start_kernel()
The function start_here_common() references
the function __init start_kernel().
This is often because start_here_common lacks a __init
annotation or the annotation of start_kernel is wrong.

There was a patch sent a year ago that addresses the issue:
https://patchwork.ozlabs.org/patch/895442/

What's the fate of it? Could it be merged?

Thank you,
Roman
