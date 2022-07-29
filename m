Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D916E5850A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:14:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSfB5sx3z3fXX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:14:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSZ32g1gz2xml
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSZ12Mrfz4xG8;
	Fri, 29 Jul 2022 23:10:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: deller@gmx.de, mrochs@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, ukrishn@linux.ibm.com, manoj@linux.ibm.com, tzimmermann@suse.de, Nicholas Piggin <npiggin@gmail.com>, martin.petersen@oracle.com, jejb@linux.ibm.com
In-Reply-To: <f75b383673663e27f6b57e50b4abfb9fe3780b00.1657264228.git.christophe.leroy@csgroup.eu>
References: <f75b383673663e27f6b57e50b4abfb9fe3780b00.1657264228.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 1/4] video: fbdev: offb: Include missing linux/platform_device.h
Message-Id: <165909976850.253830.18083403914079325529.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:48 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 8 Jul 2022 09:11:05 +0200, Christophe Leroy wrote:
> A lot of drivers were getting platform and of headers
> indirectly via headers like asm/pci.h or asm/prom.h
> 
> Most of them were fixed during 5.19 cycle but a newissue was
> introduced by commit 52b1b46c39ae ("of: Create platform devices
> for OF framebuffers")
> 
> [...]

Applied to powerpc/next.

[1/4] video: fbdev: offb: Include missing linux/platform_device.h
      https://git.kernel.org/powerpc/c/ebef8abc963b9e537c0a0d619dd8faf1b8f2b183
[2/4] scsi: cxlflash: Include missing linux/irqdomain.h
      https://git.kernel.org/powerpc/c/61657dcd528b75cd196adaf56890124c13953c8d
[3/4] powerpc: Remove asm/prom.h from asm/mpc52xx.h and asm/pci.h
      https://git.kernel.org/powerpc/c/4d5c5bad51935482437528f7fa4dffdcb3330d8b
[4/4] powerpc: Finally remove unnecessary headers from asm/prom.h
      https://git.kernel.org/powerpc/c/36afe68714d45edf34430d28e3dc787425ad8b22

cheers
