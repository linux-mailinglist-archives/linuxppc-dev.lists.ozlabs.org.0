Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A1763D24C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:44:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZ750y0Vz3fqq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:44:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYtb1mxdz3fPB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:33:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYtZ6Cjbz4xZp;
	Wed, 30 Nov 2022 20:33:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221106205839.600442-1-nayna@linux.ibm.com>
References: <20221106205839.600442-1-nayna@linux.ibm.com>
Subject: Re: [PATCH 0/6] powerpc/pseries - bugfixes/cleanups for PLPKS driver
Message-Id: <166980025961.3017288.7063318917911926713.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:19 +1100
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
Cc: gjoyce@linux.vnet.ibm.com, George Wilson <gcwilson@linux.ibm.com>, bjking1@us.ibm.com, npiggin@gmail.com, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 6 Nov 2022 15:58:33 -0500, Nayna Jain wrote:
> This patchset fixes some bugs and does some cleanups.
> 
> Nayna Jain (6):
>   powerpc/pseries: fix the object owners enum value in plpks driver
>   powerpc/pseries: Fix the H_CALL error code in PLPKS driver
>   powerpc/pseries: Return -EIO instead of -EINTR for H_ABORTED error
>   powerpc/pseries: cleanup error logs in plpks driver
>   powerpc/pseries: replace kmalloc with kzalloc in PLPKS driver
>   powerpc/pseries: fix plpks_read_var() code for different consumers
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/pseries: fix the object owners enum value in plpks driver
      https://git.kernel.org/powerpc/c/2330757e0be0acad88852e211dcd6106390a729b
[2/6] powerpc/pseries: Fix the H_CALL error code in PLPKS driver
      https://git.kernel.org/powerpc/c/af223e1728c448073d1e12fe464bf344310edeba
[3/6] powerpc/pseries: Return -EIO instead of -EINTR for H_ABORTED error
      https://git.kernel.org/powerpc/c/bb8e4c7cb759b90a04f2e94056b50288ff46a0ed
[4/6] powerpc/pseries: cleanup error logs in plpks driver
      https://git.kernel.org/powerpc/c/8888ea772972323362660e9a1339175294664a6c
[5/6] powerpc/pseries: replace kmalloc with kzalloc in PLPKS driver
      https://git.kernel.org/powerpc/c/212dd5cfbee7815f3c665a51c501701edb881599
[6/6] powerpc/pseries: fix plpks_read_var() code for different consumers
      https://git.kernel.org/powerpc/c/1f622f3f80cbf8999ff5955a2fcfbd801a1f32e0

cheers
