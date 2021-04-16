Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D6B3629E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 23:02:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMTF72Vn2z3c56
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 07:02:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Au8/f8Z1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Au8/f8Z1; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMTDk3DNdz30NG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 07:02:30 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id h15so4325488qvu.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 14:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gT4wQkvN5Ixvsn/4sCDxq8yX8MuHOkcLWPbfUYcxm3I=;
 b=Au8/f8Z1A56Cns34Kbo4AUkGJAHislwJo88Gr2mteSE25BHM/9NVKVncckuDzmlg+Z
 W2ndPtMNaxs5cCWoOxNdIfdpxMKvrHHzy065R9aLJT7ie7J9zyRorkabQpZ5vHdz1vVY
 JF6QEED3S3UxmvvzIklbXlDCKiPnux3ymzv/P6bV8cy4LnFkErGxNS/hikTmBX5Vc8N5
 t07Zxrc9D1ioZe4XuJLu8sVUFCJXMxmxwDN1Ym5/ytTIYlt0Xxg5TmAgdAYUn5yYK4Op
 ve7gwl7fkljawxqOd0i0PZQymebBinjnqDAmhPrQ8nh/lk/mNuyMPHTQDH4K3vT7DZ2+
 eGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gT4wQkvN5Ixvsn/4sCDxq8yX8MuHOkcLWPbfUYcxm3I=;
 b=h/8H2rSH7ms+iNmC+qF030vD6b/3HrL9zqA6jvuKheJyChAaBw7Er3jUwXrt0RhAwy
 Bt3JDDqOWaKoSibi4q9DzkJT3yctR4Am140Go5wikyqD3BWH2B5F5Qu0imY+aiwBLAOH
 47OOQHjzQVDrNZZFgMj9TMLdNdZMvjVp4UzgV6g0bUi0MxXbUzb8+YuT4JbZJk8lFeBv
 6R1S2zBfP9cU1n7sz7QkADPjz/1SXXXlr5a9PvA5bZBssTP4YPwxz63GVRiEQFCrH4nG
 JLTCykfieg6CEm/9InekUz1dP/QMgig79Tye+TTpUEyPJF44/oj/VqIBqpORpSb4FGW1
 TbOA==
X-Gm-Message-State: AOAM530rVpKDWMMQmt4D4gfBj0MwnGa9D2iqpc1icKsMPMnxRJhadvQ9
 Ha7kLqzBES/0LFsij3sRu+JcRNakIdQjihWxPxg=
X-Google-Smtp-Source: ABdhPJz1R+iAe85cPCbAiTe+kcbcNVtn+9IJfl3VbyD33IC9trcqFeK/BLzJtRAAFRkOYEA8ZnLINA==
X-Received: by 2002:a05:6214:d65:: with SMTP id
 5mr10456853qvs.56.1618606946317; 
 Fri, 16 Apr 2021 14:02:26 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:8811:45c7:4abc:f19a:be81])
 by smtp.gmail.com with ESMTPSA id y6sm5020671qkd.106.2021.04.16.14.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] pseries: UNISOLATE DRCs to signal device removal error
Date: Fri, 16 Apr 2021 18:02:14 -0300
Message-Id: <20210416210216.380291-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At this moment, PAPR [1] does not have a way to report errors during a device
removal operation. This puts a strain in the hypervisor, which needs extra
mechanisms to try to fallback and recover from an error that might have
happened during the removal. The QEMU community has dealt with it during these
years by either trying to preempt the error before sending the HP event or, in
case of a guest side failure, reboot the guest to complete the removal process.

This started to change with QEMU commit fe1831eff8a4 ("spapr_drc.c: use DRC
reconfiguration to cleanup DIMM unplug state"), where a way to fallback from a
memory removal error was introduced. In this case, when QEMU detects that the
kernel is reconfiguring LMBs DRCs that were marked as pending removal, the
entire process is reverted from the QEMU side as well. Around the same time,
other discussions in the QEMU mailing discussed an alternative for other device
as well.

In [2] the idea of using RTAS set-indicator for this role was first introduced.
The RTAS set-indicator call, when attempting to UNISOLATE a DRC that is already
UNISOLATED or CONFIGURED, returns RTAS_OK and does nothing else for both QEMU
and phyp. This gives us an opportunity to use this behavior to signal the
hypervisor layer when a device removal happens, allowing it to do a proper
error handling knowing for sure that the removal failed in the kernel. Using
set-indicator to report HP errors isn't strange to PAPR, as per R1-13.5.3.4-4.
of table 13.7 of [1]:

"For all DR options: If this is a DR operation that involves the user insert-
ing a DR entity, then if the firmware can determine that the inserted entity
would cause a system disturbance, then the set-indicator RTAS call must not
unisolate the entity and must return an error status which is unique to the
particular error."

PAPR does not make any restrictions or considerations about setting an already
Unisolated/Configured DRC to 'unisolate', meaning we have a chance to use it
for this purpose - signal an OS side error when attempting to remove a DR
entity.  To validate the design, this is being implemented only for CPUs.

QEMU will use this mechanism to rollback the device removal (hotunplug) state,
allowing for a better error handling mechanism. A implementation of how QEMU
can do it is in [3]. When using a kernel with this series applied, together
with this QEMU build, this is what happens in a common CPU removal/hotunplug
error scenario (trying to remove the last online CPU):

( QEMU command line: qemu-system-ppc64 -machine pseries,accel=kvm,usb=off
-smp 1,maxcpus=2,threads=1,cores=2,sockets=1 ... )

[root@localhost ~]# QEMU 5.2.92 monitor - type 'help' for more information
(qemu) device_add host-spapr-cpu-core,core-id=1,id=core1
(qemu) 

[root@localhost ~]# echo 0 > /sys/devices/system/cpu/cpu0/online
[   77.548442][   T13] IRQ 19: no longer affine to CPU0
[   77.548452][   T13] IRQ 20: no longer affine to CPU0
[   77.548458][   T13] IRQ 256: no longer affine to CPU0
[   77.548465][   T13] IRQ 258: no longer affine to CPU0
[   77.548472][   T13] IRQ 259: no longer affine to CPU0
[   77.548479][   T13] IRQ 260: no longer affine to CPU0
[   77.548485][   T13] IRQ 261: no longer affine to CPU0
[   77.548590][    T0] cpu 0 (hwid 0) Ready to die...
[root@localhost ~]# (qemu) 
(qemu) device_del core1
(qemu) [   83.214073][  T100] pseries-hotplug-cpu: Failed to offline CPU PowerPC,POWER9, rc: -16
qemu-system-ppc64: Device hotunplug rejected by the guest for device core1

(qemu) 

As soon as the CPU removal fails in dlpar_cpu(), QEMU becames aware of
it and is able to do error recovery.

If this solution is well received, I'll push for an architecture change
request internally at IBM to make this mechanism PAPR official.


[1] https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200611.pdf
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06395.html
[3] https://github.com/danielhb/qemu/tree/unisolate_drc_callback_v1

Daniel Henrique Barboza (2):
  dlpar.c: introduce dlpar_unisolate_drc()
  hotplug-cpu.c: set UNISOLATE on dlpar_cpu_remove() failure

 arch/powerpc/platforms/pseries/dlpar.c       | 14 ++++++++++++++
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  9 ++++++++-
 arch/powerpc/platforms/pseries/pseries.h     |  1 +
 3 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.30.2

