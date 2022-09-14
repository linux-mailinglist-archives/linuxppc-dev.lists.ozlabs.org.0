Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C65B8C36
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 17:48:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSPrF1kW1z3blj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 01:48:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KNSbziHi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KNSbziHi;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSPqc5TbPz2xy4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 01:47:55 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id s18so9594166plr.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3zQPL9q9eYKwVxvL3oyueWAk0Ysc7yP6QOxsSkazGJs=;
        b=KNSbziHiOn77jRsJyJnsQYPCkqijxQYiotZKSWfMHN6oNI0ElXYBFb5lAGl8st8ERa
         5B1gKaAPWJqIlIxlAJjeRvl6yqgenFaxNP7Dgn77NNDC9INfLEEoz+NdJrrhc0ZKd49L
         yEXhN3x7joGeALJqH1ohQLcKXnO4dt4FiYcSi8I7oMPjUR8F1YUKhEh+QH3Ladrf+hqz
         JCEGCjp7ExzK6wicksvfbE7xoA9JXvs1EKh87TdMoklWzPLxXRJir3Vi9TBUMSLcoATF
         laCuO7gHGVE7v2/dp08wQx9vxHpxMCGhELTu/r0xJ6w6O7SKhoweoZVQHau98pP8Ktib
         GsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3zQPL9q9eYKwVxvL3oyueWAk0Ysc7yP6QOxsSkazGJs=;
        b=IqoCNRKu9TPoc4tLIDZkON7pcNh4Mvz90OakcQgM8PC2Dzs+i4PiF7AURdOCkSTU0P
         +SujTwxyhpe4g2tiRVdWnvscX7ailLTmewBR6MQnnRABNjbPwzG4zxQzBHX9ye3l4kAq
         QIj6EmHltK9XRpxXcJd+kt1NPPXopTNkeUsgjvKD7M8JwnvCNdxae24kj72/pG4eLRR/
         LWTZNAphK7ONkZYJrUL4KUy8IZrKvOPxK8cCslJaywQaAgHeoIH/9OU1Mme9zWNliHWC
         PFavHJNHOus8483TfUmNlTf71ii7dS89WarneJBj0k4F31VlLVXEt7MsEmbk3rseQl+F
         1l5g==
X-Gm-Message-State: ACgBeo2752K2RIVUrpr4pMgQnJSBPtxcBHFkIy58xT/SgY+Ihx9l1jCd
	YSrzK/ksJ5FBny27ybawGmVmMqe18XI=
X-Google-Smtp-Source: AA6agR41+i9/T7zFW7gyE4z8UV82yUGrrWcYSAlwzahe/YeCBkyR+2Gjk/HSmYPoXTYxLfTdZZYKIQ==
X-Received: by 2002:a17:902:7204:b0:172:663f:80b7 with SMTP id ba4-20020a170902720400b00172663f80b7mr37672154plb.115.1663170473349;
        Wed, 14 Sep 2022 08:47:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00177e263303dsm9919892plr.183.2022.09.14.08.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:47:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/7] powerpc: build / linker improvements
Date: Thu, 15 Sep 2022 01:47:39 +1000
Message-Id: <20220914154746.1122482-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is mainly about moving more things out of writable and
executable memory, and slightly moving the linker script in the
direction of the binutils ld internal linker script as we do.

Thanks,
Nick

Nicholas Piggin (7):
  powerpc/build: put sys_call_table in .data.rel.ro if RELOCATABLE
  powerpc: move __end_rodata to cover arch read-only sections
  powerpc/32/build: move got1/got2 sections out of text
  powerpc/build: move got, toc, plt, branch_lt sections to read-only
  powerpc/build: move .data.rel.ro, .sdata2 to read-only
  powerpc/64/build: only include .opd with ELFv1
  powerpc/64/build: merge .got and .toc input sections

 arch/powerpc/kernel/systbl.S             |  4 ++
 arch/powerpc/kernel/vmlinux.lds.S        | 85 +++++++++++++++---------
 arch/powerpc/mm/book3s32/mmu.c           |  2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c  |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c |  2 +-
 arch/powerpc/mm/pgtable_32.c             |  5 +-
 6 files changed, 62 insertions(+), 38 deletions(-)

-- 
2.37.2

