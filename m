Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 554086A0247
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 06:11:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMh2p1kQ9z3cT4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 16:11:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fr5miP2v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMh161Sjzz3cMl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 16:10:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fr5miP2v;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PMh156vs7z4x5c;
	Thu, 23 Feb 2023 16:10:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677129018;
	bh=0ClxPO2MRWaZ78fnygNF8fDJXF366a8dE/on5zlqMaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Fr5miP2vrWFlACjCP0HICyY2xi+0AvyKpo899CT6BT4XV6B9XSQyfhDLup1O5Qm4h
	 8pY3Cz0hoPeTq5uE3QG+djV3yvUFSsyR6vdPbwVnr3ErX3QFdCDk0O590lcv6xovFv
	 F/YnTj9wlS0gUGn8E4FBetxPFMbUZwx32PE+J7ps1DFsdXRsZ26J5ZR2UcQ6dcXGuV
	 XUa2kGc3TBl1PMuBAhXXncOrEOQ83yg5CbL5ocZKxKZN6n+uyL2uZXCiUbJxcBu9kA
	 TuLCw61WO9M+XwMNIGfsezEEYtmB+ij1w9+eC/c5WG5auRoiI41P2mOOA3fRWb8fHo
	 OTSFoKbxXkP4w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Murphy Zhou <jencce.kernel@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: linux-next tree panic on ppc64le
In-Reply-To: <CADJHv_u7CGt9oM68YCLSmZTJvdq0rXcVu_1VMT=a9R3VNf8pKg@mail.gmail.com>
References: <CADJHv_tWJKgqfXy=2mynVG0U2bJaVqYo59F_OPfdRRptNOV-WQ@mail.gmail.com>
 <c69dc6be-9642-2876-5375-d536f49d0403@gmail.com>
 <CADJHv_u7CGt9oM68YCLSmZTJvdq0rXcVu_1VMT=a9R3VNf8pKg@mail.gmail.com>
Date: Thu, 23 Feb 2023 16:10:17 +1100
Message-ID: <87a615arwm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux-Next <linux-next@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Murphy Zhou <jencce.kernel@gmail.com> writes:
> On Wed, Feb 22, 2023 at 10:35 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>> On 2/22/23 07:55, Murphy Zhou wrote:
>> > [   59.558339] ------------[ cut here ]------------
>> > [   59.558361] kernel BUG at arch/powerpc/kernel/syscall.c:34!
>> > [   59.558373] Oops: Exception in kernel mode, sig: 5 [#1]
>> > [   59.558384] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
>> > [   59.558397] Modules linked in: rfkill i2c_dev sunrpc ast
>> > i2c_algo_bit drm_shmem_helper drm_kms_helper ext4 syscopyarea
>> > sysfillrect sysimgblt ofpart ses powernv_flash enclosure
>> > scsi_transport_sas ipmi_powernv at24 mbcache jbd2 ipmi_devintf
>> > regmap_i2c opal_prd ipmi_msghandler mtd ibmpowernv drm fuse
>> > drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi
>> > crc64_rocksoft_generic crc64_rocksoft crc64 sg i40e aacraid vmx_crypto
>> > [   59.558494] CPU: 29 PID: 6366 Comm: kexec Not tainted 6.2.0-next-20230221 #1
...
>> > [   60.564336]
>> > [   61.564343] Kernel panic - not syncing: Fatal exception
>>
>> Panic on what linux-next tag? Can you test powerpc/next tree?

> powerpc/next tree does not panic.

Because I applied the fix last night :)

Which is:
  f82cdc37c4bd ("powerpc/pseries: Avoid hcall in plpks_is_available() on non-pseries")

Thanks for the report.

cheers
