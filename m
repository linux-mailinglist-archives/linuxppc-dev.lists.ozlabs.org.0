Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3F94BED8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 00:04:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2dDN2Vdqz3dd4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 10:04:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Pc1SubqI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=melanieplageman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Pc1SubqI; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0gYH0C8Vz3cR1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 05:42:42 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id i6so2973027pfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 10:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MTDO2ijH97Okb1V/c6+V1GCrGsDIxaa5nQMyVR65+So=;
 b=Pc1SubqIG7PeXuoDJlxerZb7XZz2VYt5/HIAP8fhBnPYFUTEbRoPc/hD0zar1bma3V
 4HokjUXlFlCzkXeRBqZNmGCQ3l8CKYg2jhW1k3CKkxdouixmWBwlfbye2k3T5UVN4AWn
 52n/4TpQSOJ6fiHWHFjwReUOQC0he3x2HgAi44cVWeTV8w05Sa1D9bOyeAsYJF4B+JWR
 mBc9C6T9ZP/m0MlZ+TuVliGVdVQimrRNJyC5IpsM6L0bfkOB3XBCD/HU3/YKOhebN7mq
 J+lsn34usoaevMCZEEoXO5bPVPzQN4y1vAeuDaooWztwMJK90R8IU55MMcJYkL/7yE9H
 qIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MTDO2ijH97Okb1V/c6+V1GCrGsDIxaa5nQMyVR65+So=;
 b=3o17kxWCQwum5xG8wA9YkId/O7r5PTxe39lpJeDwsac9zS5fWtI3PiXJ4j8sNmGkjK
 KNvdt4Do4NQsAyJdtmncHC9sogf4Zz6q8Ia5yli4NRVg8sXPxUGp00fsExj+mPodJ1tz
 3s4FfKEJ4PwscvHdwKM1SOSK7CIi1QapesIlnkWhJ8DYp6nzX655x0rkJSrgrVjxsBqI
 3YYz7fg02OPmH0KhKcnuZrorzsD2N4Rgx48+W2Msp/jyOZWT7mseh8THNrkBrnHzwrbT
 0EIujqD86FOUtc8Eb9SP5ak95lRNGqPepqH+WLSKDT6qCPtwn8rnVDPKZyIpGEACltCt
 b5xQ==
X-Gm-Message-State: AOAM53006yp2FeC6hKCLVTB3CHX8VYrVgP/3YbIYk7uIbMsLpqI0JsxX
 wjluafn8z5gZMtdK96BCdUE=
X-Google-Smtp-Source: ABdhPJwlYmGekFiFlVU1QipHTqjBlqB1DVOw04uJcuNNV1Cz3CVl3v/qDadRl9ArZAyNjW9xzofVrg==
X-Received: by 2002:a65:6e4b:0:b0:373:8350:cef3 with SMTP id
 be11-20020a656e4b000000b003738350cef3mr7362940pgb.219.1645209761285; 
 Fri, 18 Feb 2022 10:42:41 -0800 (PST)
Received: from vm-111.3frfxmc3btcupaqenzdpat1uec.xx.internal.cloudapp.net
 ([13.77.171.140]) by smtp.gmail.com with ESMTPSA id
 m17-20020a17090ab79100b001b89fd7e298sm130132pjr.4.2022.02.18.10.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 10:42:40 -0800 (PST)
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
Subject: [PATCH RFC v1 5/5] scsi: storvsc: Hardware queues share blk_mq_tags
Date: Fri, 18 Feb 2022 18:41:57 +0000
Message-Id: <20220218184157.176457-6-melanieplageman@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218184157.176457-1-melanieplageman@gmail.com>
References: <20220218184157.176457-1-melanieplageman@gmail.com>
MIME-Version: 1.0
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

Decouple the number of tags available from the number of hardware queues
by sharing a single blk_mq_tags amongst all hardware queues.

When storage latency is relatively high, having too many tags available
can harm the performance of mixed workloads.
By sharing blk_mq_tags amongst hardware queues, nr_requests can be set
to the appropriate number of tags for the device.

Signed-off-by: Melanie Plageman <melanieplageman@gmail.com>
---
As an example, on a 16-core VM coupled with a 1 TiB storage device having a
combined (VM + disk) max BW of 200 MB/s and IOPS of 5000, configured with 16
hardware queues and with nr_requests set to 56 and queue_depth set to 15, the
following fio job description illustrates the benefit of hardware queues sharing
blk_mq_tags:

[global]
time_based=1
ioengine=io_uring
direct=1
runtime=60

[read_hogs]
bs=16k
iodepth=10000
rw=randread
filesize=10G
numjobs=15
directory=/mnt/test

[wal]
bs=8k
iodepth=3
filesize=4G
rw=write
numjobs=1
directory=/mnt/test

with hctx_share_tags set, the "wal" job does 271 IOPS, averaging 13120 usec
completion latency and the "read_hogs" jobs average around 4700 IOPS.

without hctx_share_tags set, the "wal" job does 85 IOPS and averages around
45308 usec completion latency and the "read_hogs" job average around 4900 IOPS.

Note that reducing nr_requests to a number sufficient to increase WAL IOPS
results in unacceptably low IOPS for the random reads when only one random read
job is running.

 drivers/scsi/storvsc_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index 0ed764bcabab..5048e7fcf959 100644
--- a/drivers/scsi/storvsc_drv.c
+++ b/drivers/scsi/storvsc_drv.c
@@ -1997,6 +1997,7 @@ static struct scsi_host_template scsi_driver = {
 	.track_queue_depth =	1,
 	.change_queue_depth =	storvsc_change_queue_depth,
 	.per_device_tag_set =	1,
+	.hctx_share_tags = 1,
 };
 
 enum {
-- 
2.25.1

