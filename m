Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8DF4BED88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 00:01:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2d8q1bjkz3cVT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 10:01:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Phel3WU2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=melanieplageman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Phel3WU2; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0gXz10Zxz3cQ4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 05:42:26 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so9339171pjm.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 10:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nnqs2i3CbIkQ3bVMxoGrLeUx3g6Lb79sXLNwOk6juzs=;
 b=Phel3WU2HisZwY9XcLTeu/3s6bfaogdNaZMw3cFp4poK89Xk4YikVwxrutvHeHpHOh
 Ccn5rX/WDSj03d49PnBE0GDHq145T9nvGaVqGxowpj2SHqUxfDiJwJHeHL114xg4lSux
 z3iDMh4UCS0cSR4aoSWD1dgr6ydfD5GgP7GS2nGV7A/7uzXVIUMq0HQmP1l4ElOYyO74
 5gAbfdqjjQcajf4voIeEsb/krvVft8gb9h5iKX+KE0ETK2SysAkeALVHASpf5dN3Zwri
 aGugr/TycPBhZiKkCryRooTQuOOejpBz31mUeHfuEbHA7+tlgQ6YEJgksyQUu4BxvYdg
 eX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nnqs2i3CbIkQ3bVMxoGrLeUx3g6Lb79sXLNwOk6juzs=;
 b=X2v46ulsbb1VasQOsNL0yHghRNLwoCgqLrYQGprqHmthOsGks521gxrLnJHklsO43q
 I6P7q+OcE7yet3NxSI6oAeOUYunlaTMEe0CXDVf5yxLiSxIcCuPZzcreDBcJ0Kw2PBCG
 AizcESebLaFm939y8C6O7uYJUlDtjGdMnvHvmKtrcPRbn6HAWKgF7kc+Iflfg5Iotsow
 94C2GuG/ebfFDZBbgqRCR5T//W7wtDn+A2kZ/pFPELASGsw8LMdnFr47g30e8U5lULLD
 iHgIRtlxQBsPQbwZHpei0iht//MDaPiHEBWR0iGl/GJLX4UUQFmUVPwo/Unb3V71KAtW
 y7Tg==
X-Gm-Message-State: AOAM5322s+C1/hqiyAYqDts+PDJvFr91TnLmTEJzPxA0jU+qR9UrrZnd
 zEZKt0HGHwXosADkpCl8d70=
X-Google-Smtp-Source: ABdhPJzeSsANWmrSK4KLIsv7Vg+I8RcsUoH5th+/D8fOdaSN6gdAokqYefCoEvMQma/L/jFYS34KUg==
X-Received: by 2002:a17:90b:388d:b0:1b9:950c:f08b with SMTP id
 mu13-20020a17090b388d00b001b9950cf08bmr13986149pjb.49.1645209743466; 
 Fri, 18 Feb 2022 10:42:23 -0800 (PST)
Received: from vm-111.3frfxmc3btcupaqenzdpat1uec.xx.internal.cloudapp.net
 ([13.77.171.140]) by smtp.gmail.com with ESMTPSA id
 m17-20020a17090ab79100b001b89fd7e298sm130132pjr.4.2022.02.18.10.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 10:42:23 -0800 (PST)
From: "Melanie Plageman (Microsoft)" <melanieplageman@gmail.com>
To: mikelley@microsoft.com, jejb@linux.ibm.com, kys@microsoft.com,
 martin.petersen@oracle.com, mst@redhat.com, benh@kernel.crashing.org,
 decui@microsoft.com, don.brace@microchip.com,
 R-QLogic-Storage-Upstream@marvell.com, haiyangz@microsoft.com,
 jasowang@redhat.com, john.garry@huawei.com, kashyap.desai@broadcom.com,
 mpe@ellerman.id.au, njavali@marvell.com, pbonzini@redhat.com,
 paulus@samba.org, sathya.prakash@broadcom.com,
 shivasharan.srikanteshwara@broadcom.com, sreekanth.reddy@broadcom.com,
 stefanha@redhat.com, sthemmin@microsoft.com,
 suganath-prabu.subramani@broadcom.com, sumit.saxena@broadcom.com,
 tyreld@linux.ibm.com, wei.liu@kernel.org, linuxppc-dev@lists.ozlabs.org,
 megaraidlinux.pdl@broadcom.com, mpi3mr-linuxdrv.pdl@broadcom.com,
 storagedev@microchip.com, virtualization@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com
Subject: [PATCH RFC v1 0/5] Add SCSI per device tagsets
Date: Fri, 18 Feb 2022 18:41:52 +0000
Message-Id: <20220218184157.176457-1-melanieplageman@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Feb 2022 10:00:38 +1100
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
Cc: andres@anarazel.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently a single blk_mq_tag_set is associated with a Scsi_Host. When SCSI
controllers are limited, attaching multiple devices to the same controller is
required. In cloud environments with relatively high latency persistent storage,
requiring all devices on a controller to share a single blk_mq_tag_set
negatively impacts performance.

For example: a device provisioned with high IOPS and BW limits on the same
controller as a smaller and slower device can starve the slower device of tags.
This is especially noticeable when the slower device's workload has low I/O
depth tasks.
A common configuration for a journaling database application would be to
configure all I/O except journaling writes to target one device and target the
journaling writes to another device. This can decrease transaction commit
latency and improve performance. However, an I/O-bound database workload, for
example one with a large number of random reads on the device with high
provisioned IOPS, can consume all of the tags in the Scsi_Host tag set,
resulting in poor overall performance as the journaling writes experience high
latency.

Given a 16-core VM with two devices attached to the same controller, the first
with a combined (VM + disk) provisioned bandwidth of 750 MBps and 18000 IOPS
mounted at /mnt/big_device and the second with a combined provisioned bandwidth
of 170 MBps and 3500 IOPS mounted at /mnt/small_device:

The following fio job description demonstrates the benefit of per device tag
sets:

[global]
time_based=1
ioengine=io_uring
direct=1
runtime=1000

[read_hogs]
bs=16k
iodepth=10000
rw=randread
filesize=10G
numjobs=32
directory=/mnt/big_device

[wal]
bs=8k
iodepth=3
filesize=4G
rw=write
numjobs=1
directory=/mnt/small_device

Also note that for this example I have configured:
small device LUN queue depth: 10
large device LUN queue depth: 70
nr_hw_queues: 1
nr_requests: 170

On master, the sequential write job averages around 5 MBps. The random reads hit
the provisioned IOPS on both master and with the patch. With the patch for per
device tag sets, the sequential write job averages 29 MBps -- the same as this
job running alone on the VM.

Open questions and TODOs:

The following open items are for the "Add per device tag sets" patch:

- show_nr_hw_queues() does not work in this implementation. I wasn't
  sure how to access the scsi_device to get the blk_mq_tag_set. I also
  assume there are other sysfs changes that need to be made but I wasn't
  sure which.

- scsi_host_busy(): I've modified scsi_host_busy() such that, when device
  tag sets are in use, its remaining callers will iterate over all the
  attached devices and check their associated blk_mq_tag_sets. I don't
  know if this is the correct thing to do.

  What does the concept of the host being busy mean with device tag
  sets? Does it depend on the caller and the context? Should this form a
  new concept of scsi device busy?

  Also, could this cause deadlocks since this iteration requires the
  host_lock?

  I assume that there still needs to be a concept of host failed
  (Scsi_Host->host_failed) even with device tag sets because if all of
  the inflight requests for a host have failed, then something is
  probably wrong with the controller?

- scsi_host_queue_ready(): I've modified scsi_host_queue_ready() such
  that, when device tag sets are in use, it will only check the device
  tag set when determining starvation. It seemed to me that if a request
  can only acquire a tag from its target device's tag set, then it
  doesn't matter if other tag sets on the host have available tags.

Melanie Plageman (Microsoft) (5):
  scsi: core: Rename host_tagset to hctx_share_tags
  scsi: map_queues() takes tag set instead of host
  scsi: core: Add per device tag sets
  scsi: storvsc: use per device tag sets
  scsi: storvsc: Hardware queues share blk_mq_tags

 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c    |  7 +-
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c    |  7 +-
 drivers/scsi/hosts.c                      | 32 ++++++---
 drivers/scsi/ibmvscsi/ibmvfc.c            |  2 +-
 drivers/scsi/megaraid/megaraid_sas_base.c |  8 ++-
 drivers/scsi/mpi3mr/mpi3mr_os.c           |  4 +-
 drivers/scsi/mpt3sas/mpt3sas_base.c       |  6 +-
 drivers/scsi/mpt3sas/mpt3sas_scsih.c      |  9 +--
 drivers/scsi/qla2xxx/qla_os.c             |  7 +-
 drivers/scsi/scsi_debug.c                 |  7 +-
 drivers/scsi/scsi_lib.c                   | 30 +++++---
 drivers/scsi/scsi_priv.h                  |  2 +-
 drivers/scsi/scsi_scan.c                  | 30 ++++++--
 drivers/scsi/scsi_sysfs.c                 | 11 ++-
 drivers/scsi/smartpqi/smartpqi_init.c     |  7 +-
 drivers/scsi/storvsc_drv.c                | 86 +++++++++++++++++++++--
 drivers/scsi/virtio_scsi.c                |  5 +-
 include/scsi/scsi_device.h                |  1 +
 include/scsi/scsi_host.h                  | 53 ++++++++++++--
 include/scsi/scsi_tcq.h                   | 15 ++--
 20 files changed, 258 insertions(+), 71 deletions(-)

-- 
2.25.1

