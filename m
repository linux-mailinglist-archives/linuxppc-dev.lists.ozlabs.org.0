Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7C433EC77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 10:13:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0kwg2xYYz3bsF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 20:13:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FktGAXs/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FktGAXs/; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0kwD5Xqjz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 20:13:16 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id v4so992334wrp.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RAN4ynbW/anRZapL8VFvkYH+oK0hgHEKhtHWyGXNsOA=;
 b=FktGAXs/eoUNfYdWLU7tDWHTlujziL8THin6aXwC0mLXOx9l5PwsLY1kGyrloBn4Xr
 VRFG1jCW4G3OzR02bgNRaCJ/ZeW4MXwjWnGRhZSScDJcASdxBsJkTngAnq2YZxT3llQ6
 2/VYrDuob3EKFqnTCzF9hdTfinHqE1b9yI/v6dtgiPKFBRiwze9IsCrKnPUdI778dkih
 R9alWxabkffHiAbQwu4Jy572SZ/5ckc3EhwkTaGL7YxRimuT3eatfB5ptGT42Lr7iaRz
 dtPjQWlh0Aa1V5UasZH/k3uPMTBujtWS4ahRJJ5Iig9wKavld0BZExhRm/rXz1x5LckV
 GIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RAN4ynbW/anRZapL8VFvkYH+oK0hgHEKhtHWyGXNsOA=;
 b=CTtNE5LBEbYi7FO7eJakB7bgmW2dbyW0pmaKVUIAY3p3jUZPJtQugMatd4dE7D0Tzs
 ssjtt8VF1YtcHdrKPliUV4Kk+IJyjK6jNw1vwwr2pliavDa+fg1nSx9IYlFoNh7kTVA7
 gV/VmpVNqaYLlpHZOPWCOK+MCGzd8yrYA2VGwCtfiDjLYiXih+HrgWBvxGlMUTUFGHqF
 knK7hLdV0w/dBx5sVYe9egLdUOyj51knM0w45TrucquLJqJ//269BO7tFvK4cfIvyDW2
 heq2sEljK7avosSPtqmJ1moMxpXTYDeEkmLVCtQsVdXrz+xHCUhotktE/eFLceWmwCje
 9D1A==
X-Gm-Message-State: AOAM531SPL5mFiDaD5RJu0R7bu4TVi97x6PGxFxZNK9vknVavgu1b7+Y
 VnbtGIeNesHaEMdlMHJrAkqvVw==
X-Google-Smtp-Source: ABdhPJz6XZjHnqaL2uMWijHsG8W9O6bEgDTV6HVzVyEjLfg6g3YE/V6PVqb5sqpaBoQvxmqaANDDvw==
X-Received: by 2002:adf:9c86:: with SMTP id d6mr3323500wre.306.1615972393301; 
 Wed, 17 Mar 2021 02:13:13 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id e18sm12695886wru.73.2021.03.17.02.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:13:12 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/36] scsi: ibmvscsi: Fix a bunch of kernel-doc related issues
Date: Wed, 17 Mar 2021 09:12:27 +0000
Message-Id: <20210317091230.2912389-34-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210317091230.2912389-1-lee.jones@linaro.org>
References: <20210317091230.2912389-1-lee.jones@linaro.org>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Dave Boutcher <sleddog@us.ibm.com>, linux-kernel@vger.kernel.org,
 Santiago Leon <santil@us.ibm.com>, Colin DeVilbiss <devilbis@us.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/scsi/ibmvscsi/ibmvscsi.c:143: warning: Function parameter or member 'hostdata' not described in 'ibmvscsi_release_crq_queue'
 drivers/scsi/ibmvscsi/ibmvscsi.c:143: warning: Function parameter or member 'max_requests' not described in 'ibmvscsi_release_crq_queue'
 drivers/scsi/ibmvscsi/ibmvscsi.c:143: warning: expecting prototype for release_crq_queue(). Prototype was for ibmvscsi_release_crq_queue() instead
 drivers/scsi/ibmvscsi/ibmvscsi.c:286: warning: expecting prototype for reset_crq_queue(). Prototype was for ibmvscsi_reset_crq_queue() instead
 drivers/scsi/ibmvscsi/ibmvscsi.c:328: warning: Function parameter or member 'max_requests' not described in 'ibmvscsi_init_crq_queue'
 drivers/scsi/ibmvscsi/ibmvscsi.c:328: warning: expecting prototype for initialize_crq_queue(). Prototype was for ibmvscsi_init_crq_queue() instead
 drivers/scsi/ibmvscsi/ibmvscsi.c:414: warning: expecting prototype for reenable_crq_queue(). Prototype was for ibmvscsi_reenable_crq_queue() instead
 drivers/scsi/ibmvscsi/ibmvscsi.c:536: warning: expecting prototype for ibmvscsi_free(). Prototype was for free_event_struct() instead
 drivers/scsi/ibmvscsi/ibmvscsi.c:558: warning: expecting prototype for get_evt_struct(). Prototype was for get_event_struct() instead
 drivers/scsi/ibmvscsi/ibmvscsi.c:587: warning: Function parameter or member 'evt_struct' not described in 'init_event_struct'
 drivers/scsi/ibmvscsi/ibmvscsi.c:587: warning: Excess function parameter 'evt' description in 'init_event_struct'
 drivers/scsi/ibmvscsi/ibmvscsi.c:608: warning: Function parameter or member 'cmd' not described in 'set_srp_direction'
 drivers/scsi/ibmvscsi/ibmvscsi.c:608: warning: Function parameter or member 'srp_cmd' not described in 'set_srp_direction'
 drivers/scsi/ibmvscsi/ibmvscsi.c:608: warning: Function parameter or member 'numbuf' not described in 'set_srp_direction'
 drivers/scsi/ibmvscsi/ibmvscsi.c:641: warning: Function parameter or member 'evt_struct' not described in 'unmap_cmd_data'
 drivers/scsi/ibmvscsi/ibmvscsi.c:683: warning: Function parameter or member 'evt_struct' not described in 'map_sg_data'
 drivers/scsi/ibmvscsi/ibmvscsi.c:757: warning: Function parameter or member 'evt_struct' not described in 'map_data_for_srp_cmd'
 drivers/scsi/ibmvscsi/ibmvscsi.c:783: warning: Function parameter or member 'error_code' not described in 'purge_requests'
 drivers/scsi/ibmvscsi/ibmvscsi.c:846: warning: Function parameter or member 't' not described in 'ibmvscsi_timeout'
 drivers/scsi/ibmvscsi/ibmvscsi.c:846: warning: Excess function parameter 'evt_struct' description in 'ibmvscsi_timeout'
 drivers/scsi/ibmvscsi/ibmvscsi.c:1043: warning: Function parameter or member 'cmnd' not described in 'ibmvscsi_queuecommand_lck'
 drivers/scsi/ibmvscsi/ibmvscsi.c:1043: warning: expecting prototype for ibmvscsi_queue(). Prototype was for ibmvscsi_queuecommand_lck() instead
 drivers/scsi/ibmvscsi/ibmvscsi.c:1351: warning: expecting prototype for init_host(). Prototype was for enable_fast_fail() instead
 drivers/scsi/ibmvscsi/ibmvscsi.c:1464: warning: Function parameter or member 'hostdata' not described in 'init_adapter'
 drivers/scsi/ibmvscsi/ibmvscsi.c:1475: warning: Function parameter or member 'evt_struct' not described in 'sync_completion'
 drivers/scsi/ibmvscsi/ibmvscsi.c:1488: warning: Function parameter or member 'cmd' not described in 'ibmvscsi_eh_abort_handler'
 drivers/scsi/ibmvscsi/ibmvscsi.c:1488: warning: expecting prototype for ibmvscsi_abort(). Prototype was for ibmvscsi_eh_abort_handler() instead
 drivers/scsi/ibmvscsi/ibmvscsi.c:1627: warning: Function parameter or member 'cmd' not described in 'ibmvscsi_eh_device_reset_handler'
 drivers/scsi/ibmvscsi/ibmvscsi.c:1893: warning: Excess function parameter 'reason' description in 'ibmvscsi_change_queue_depth'
 drivers/scsi/ibmvscsi/ibmvscsi.c:2221: warning: Function parameter or member 'vdev' not described in 'ibmvscsi_probe'
 drivers/scsi/ibmvscsi/ibmvscsi.c:2221: warning: Function parameter or member 'id' not described in 'ibmvscsi_probe'
 drivers/scsi/ibmvscsi/ibmvscsi.c:2221: warning: expecting prototype for Called by bus code for each adapter(). Prototype was for ibmvscsi_probe() instead
 drivers/scsi/ibmvscsi/ibmvscsi.c:2381: warning: cannot understand function prototype: 'const struct vio_device_id ibmvscsi_device_table[] = '

Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Colin DeVilbiss <devilbis@us.ibm.com>
Cc: Santiago Leon <santil@us.ibm.com>
Cc: Dave Boutcher <sleddog@us.ibm.com>
Cc: linux-scsi@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/scsi/ibmvscsi/ibmvscsi.c | 70 ++++++++++++++++----------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 77fafb1bc173a..9ffd71e425f90 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -130,9 +130,10 @@ static irqreturn_t ibmvscsi_handle_event(int irq, void *dev_instance)
 }
 
 /**
- * release_crq_queue: - Deallocates data and unregisters CRQ
- * @queue:	crq_queue to initialize and register
- * @host_data:	ibmvscsi_host_data of host
+ * ibmvscsi_release_crq_queue() - Deallocates data and unregisters CRQ
+ * @queue:		crq_queue to initialize and register
+ * @hostdata:		ibmvscsi_host_data of host
+ * @max_requests:	maximum requests (unused)
  *
  * Frees irq, deallocates a page for messages, unmaps dma, and unregisters
  * the crq with the hypervisor.
@@ -276,10 +277,9 @@ static void set_adapter_info(struct ibmvscsi_host_data *hostdata)
 }
 
 /**
- * reset_crq_queue: - resets a crq after a failure
+ * ibmvscsi_reset_crq_queue() - resets a crq after a failure
  * @queue:	crq_queue to initialize and register
  * @hostdata:	ibmvscsi_host_data of host
- *
  */
 static int ibmvscsi_reset_crq_queue(struct crq_queue *queue,
 				    struct ibmvscsi_host_data *hostdata)
@@ -314,9 +314,10 @@ static int ibmvscsi_reset_crq_queue(struct crq_queue *queue,
 }
 
 /**
- * initialize_crq_queue: - Initializes and registers CRQ with hypervisor
- * @queue:	crq_queue to initialize and register
- * @hostdata:	ibmvscsi_host_data of host
+ * ibmvscsi_init_crq_queue() - Initializes and registers CRQ with hypervisor
+ * @queue:		crq_queue to initialize and register
+ * @hostdata:		ibmvscsi_host_data of host
+ * @max_requests:	maximum requests (unused)
  *
  * Allocates a page for messages, maps it for dma, and registers
  * the crq with the hypervisor.
@@ -404,10 +405,9 @@ static int ibmvscsi_init_crq_queue(struct crq_queue *queue,
 }
 
 /**
- * reenable_crq_queue: - reenables a crq after
+ * ibmvscsi_reenable_crq_queue() - reenables a crq after
  * @queue:	crq_queue to initialize and register
  * @hostdata:	ibmvscsi_host_data of host
- *
  */
 static int ibmvscsi_reenable_crq_queue(struct crq_queue *queue,
 				       struct ibmvscsi_host_data *hostdata)
@@ -439,7 +439,7 @@ static int ibmvscsi_reenable_crq_queue(struct crq_queue *queue,
  * @hostdata:	ibmvscsi_host_data who owns the event pool
  *
  * Returns zero on success.
-*/
+ */
 static int initialize_event_pool(struct event_pool *pool,
 				 int size, struct ibmvscsi_host_data *hostdata)
 {
@@ -478,12 +478,12 @@ static int initialize_event_pool(struct event_pool *pool,
 }
 
 /**
- * release_event_pool: - Frees memory of an event pool of a host
+ * release_event_pool() - Frees memory of an event pool of a host
  * @pool:	event_pool to be released
  * @hostdata:	ibmvscsi_host_data who owns the even pool
  *
  * Returns zero on success.
-*/
+ */
 static void release_event_pool(struct event_pool *pool,
 			       struct ibmvscsi_host_data *hostdata)
 {
@@ -526,11 +526,10 @@ static int valid_event_struct(struct event_pool *pool,
 }
 
 /**
- * ibmvscsi_free-event_struct: - Changes status of event to "free"
+ * free_event_struct() - Changes status of event to "free"
  * @pool:	event_pool that contains the event
  * @evt:	srp_event_struct to be modified
- *
-*/
+ */
 static void free_event_struct(struct event_pool *pool,
 				       struct srp_event_struct *evt)
 {
@@ -547,7 +546,7 @@ static void free_event_struct(struct event_pool *pool,
 }
 
 /**
- * get_evt_struct: - Gets the next free event in pool
+ * get_event_struct() - Gets the next free event in pool
  * @pool:	event_pool that contains the events to be searched
  *
  * Returns the next event in "free" state, and NULL if none are free.
@@ -575,7 +574,7 @@ static struct srp_event_struct *get_event_struct(struct event_pool *pool)
 /**
  * init_event_struct: Initialize fields in an event struct that are always 
  *                    required.
- * @evt:        The event
+ * @evt_struct: The event
  * @done:       Routine to call when the event is responded to
  * @format:     SRP or MAD format
  * @timeout:    timeout value set in the CRQ
@@ -597,7 +596,7 @@ static void init_event_struct(struct srp_event_struct *evt_struct,
  * Routines for receiving SCSI responses from the hosting partition
  */
 
-/**
+/*
  * set_srp_direction: Set the fields in the srp related to data
  *     direction and number of buffers based on the direction in
  *     the scsi_cmnd and the number of buffers
@@ -632,9 +631,9 @@ static void set_srp_direction(struct scsi_cmnd *cmd,
 /**
  * unmap_cmd_data: - Unmap data pointed in srp_cmd based on the format
  * @cmd:	srp_cmd whose additional_data member will be unmapped
+ * @evt_struct: the event
  * @dev:	device for which the memory is mapped
- *
-*/
+ */
 static void unmap_cmd_data(struct srp_cmd *cmd,
 			   struct srp_event_struct *evt_struct,
 			   struct device *dev)
@@ -671,6 +670,7 @@ static int map_sg_list(struct scsi_cmnd *cmd, int nseg,
 /**
  * map_sg_data: - Maps dma for a scatterlist and initializes descriptor fields
  * @cmd:	struct scsi_cmnd with the scatterlist
+ * @evt_struct:	struct srp_event_struct to map
  * @srp_cmd:	srp_cmd that contains the memory descriptor
  * @dev:	device for which to map dma memory
  *
@@ -745,6 +745,7 @@ static int map_sg_data(struct scsi_cmnd *cmd,
 /**
  * map_data_for_srp_cmd: - Calls functions to map data for srp cmds
  * @cmd:	struct scsi_cmnd with the memory to be mapped
+ * @evt_struct:	struct srp_event_struct to map
  * @srp_cmd:	srp_cmd that contains the memory descriptor
  * @dev:	dma device for which to map dma memory
  *
@@ -778,6 +779,7 @@ static int map_data_for_srp_cmd(struct scsi_cmnd *cmd,
 /**
  * purge_requests: Our virtual adapter just shut down.  purge any sent requests
  * @hostdata:    the adapter
+ * @error_code:  error code to return as the 'result'
  */
 static void purge_requests(struct ibmvscsi_host_data *hostdata, int error_code)
 {
@@ -838,7 +840,7 @@ static void ibmvscsi_reset_host(struct ibmvscsi_host_data *hostdata)
 
 /**
  * ibmvscsi_timeout - Internal command timeout handler
- * @evt_struct:	struct srp_event_struct that timed out
+ * @t:	struct srp_event_struct that timed out
  *
  * Called when an internally generated command times out
 */
@@ -1034,8 +1036,8 @@ static inline u16 lun_from_dev(struct scsi_device *dev)
 }
 
 /**
- * ibmvscsi_queue: - The queuecommand function of the scsi template 
- * @cmd:	struct scsi_cmnd to be executed
+ * ibmvscsi_queuecommand_lck() - The queuecommand function of the scsi template 
+ * @cmnd:	struct scsi_cmnd to be executed
  * @done:	Callback function to be called when cmd is completed
 */
 static int ibmvscsi_queuecommand_lck(struct scsi_cmnd *cmnd,
@@ -1342,7 +1344,7 @@ static void fast_fail_rsp(struct srp_event_struct *evt_struct)
 }
 
 /**
- * init_host - Start host initialization
+ * enable_fast_fail() - Start host initialization
  * @hostdata:	ibmvscsi_host_data of host
  *
  * Returns zero if successful.
@@ -1456,16 +1458,15 @@ static void send_mad_adapter_info(struct ibmvscsi_host_data *hostdata)
 	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 };
 
-/**
- * init_adapter: Start virtual adapter initialization sequence
- *
+/*
+ * init_adapter() - Start virtual adapter initialization sequence
  */
 static void init_adapter(struct ibmvscsi_host_data *hostdata)
 {
 	send_mad_adapter_info(hostdata);
 }
 
-/**
+/*
  * sync_completion: Signal that a synchronous command has completed
  * Note that after returning from this call, the evt_struct is freed.
  * the caller waiting on this completion shouldn't touch the evt_struct
@@ -1480,8 +1481,8 @@ static void sync_completion(struct srp_event_struct *evt_struct)
 	complete(&evt_struct->comp);
 }
 
-/**
- * ibmvscsi_abort: Abort a command...from scsi host template
+/*
+ * ibmvscsi_eh_abort_handler: Abort a command...from scsi host template
  * send this over to the server and wait synchronously for the response
  */
 static int ibmvscsi_eh_abort_handler(struct scsi_cmnd *cmd)
@@ -1618,7 +1619,7 @@ static int ibmvscsi_eh_abort_handler(struct scsi_cmnd *cmd)
 	return SUCCESS;
 }
 
-/**
+/*
  * ibmvscsi_eh_device_reset_handler: Reset a single LUN...from scsi host 
  * template send this over to the server and wait synchronously for the 
  * response
@@ -1884,7 +1885,6 @@ static int ibmvscsi_slave_configure(struct scsi_device *sdev)
  * ibmvscsi_change_queue_depth - Change the device's queue depth
  * @sdev:	scsi device struct
  * @qdepth:	depth to set
- * @reason:	calling context
  *
  * Return value:
  * 	actual depth set
@@ -2214,7 +2214,7 @@ static int ibmvscsi_work(void *data)
 	return 0;
 }
 
-/**
+/*
  * Called by bus code for each adapter
  */
 static int ibmvscsi_probe(struct vio_dev *vdev, const struct vio_device_id *id)
@@ -2374,7 +2374,7 @@ static int ibmvscsi_resume(struct device *dev)
 	return 0;
 }
 
-/**
+/*
  * ibmvscsi_device_table: Used by vio.c to match devices in the device tree we 
  * support.
  */
-- 
2.27.0

