Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DDF20F6EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 16:14:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x5vT4pjdzDqjX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 00:14:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Tpifyogt; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x5Wr0hqTzDqGX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 23:57:11 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id dp18so20734921ejc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Vgj6mJ007ffR2XpxkUWmsRKmQ1//Tce8MuBu+oPzlU=;
 b=TpifyogtmSQyoYQkRCsDn943WBZc7wqFAHoz5GIiSpG94b7uokBuZwOSI3krYEDuIZ
 rFXoISEx06/BbuCR5VaMBQujjIk44C2m3HNDPGCyDaWpb7154AzN435wx/tD0npm9m+v
 R65mNjskdTU6G0NRxvyTGhXjBReTvGUeBKaqJJnLBm3CTy2N/FTEAd7Of9BLBWysQGWr
 1nx6FcwuKJv2b0fwL/qC/HkpqhsYGRH+GBnF81zCDMv+S4YKI3ZGYxBHFQTFMImlMZ4V
 mSkC43Hxq9EClkoTAWRsHGtsbVNSchBai6am4E8ViMGIjYvNOhAQxw0LTiOZPVJeEirj
 pMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Vgj6mJ007ffR2XpxkUWmsRKmQ1//Tce8MuBu+oPzlU=;
 b=mub+ZJZy4gwXIF1X7nFfsPEihR/Het2tIP3GZFDxgbNPncG9SI639fQU52V9/4rDAJ
 QfMDrXA2rAOPMexHU8k/9LIRn0jqirO9mt2sj2DSjBF0egAtJmdUDRr9kShR04OhR/aw
 EFd685rln+Z1SfAsoa7wr4qy9lga8nJb/sJpSDFI7OjQl/acGb2Jp2IAcajhzQwgofhp
 sLbWbbbRSoBG6uRppzNtmHKs763i95BD86W0p32/KAOM9BYLlaQqw6gKF2m9c+8U6JXs
 nSLKFZBbTFkKbaiNO+QIxck2/+dfmd8UpM5CgQtb2QKhbY+859WirnId+ZU845lMhp6F
 9HRg==
X-Gm-Message-State: AOAM5305sdaWqHumTsOwIIyKl0ISYw871yHZ23uYv0nLquqG5dGVZgt4
 SpaCdfsFnuO8xeIZigAFWO9W+Vzgj6Q=
X-Google-Smtp-Source: ABdhPJx721IVepbgyMmVRJlfPKLFs9l9eVG25Gkt/1drnG8PPf9M+3ev+koLG4DTEaifYuBuIbULTA==
X-Received: by 2002:adf:edc6:: with SMTP id v6mr22116585wro.413.1593525102783; 
 Tue, 30 Jun 2020 06:51:42 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id t4sm3876746wmf.4.2020.06.30.06.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 06:51:42 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH 27/30] misc: cxl: hcalls: Demote half-assed kerneldoc attempt
Date: Tue, 30 Jun 2020 14:51:07 +0100
Message-Id: <20200630135110.2236389-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630135110.2236389-1-lee.jones@linaro.org>
References: <20200630135110.2236389-1-lee.jones@linaro.org>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Function headers will need a lot of work before they reach the
standards expected of kerneldoc.  Demote them down to basic
comments/headers, for now at least.

Fixes the following W=1 kernel build warnings:

 drivers/misc/cxl/hcalls.c:175: warning: Function parameter or member 'unit_address' not described in 'cxl_h_detach_process'
 drivers/misc/cxl/hcalls.c:175: warning: Function parameter or member 'process_token' not described in 'cxl_h_detach_process'
 drivers/misc/cxl/hcalls.c:207: warning: Function parameter or member 'unit_address' not described in 'cxl_h_control_function'
 drivers/misc/cxl/hcalls.c:207: warning: Function parameter or member 'op' not described in 'cxl_h_control_function'
 drivers/misc/cxl/hcalls.c:207: warning: Function parameter or member 'p1' not described in 'cxl_h_control_function'
 drivers/misc/cxl/hcalls.c:207: warning: Function parameter or member 'p2' not described in 'cxl_h_control_function'
 drivers/misc/cxl/hcalls.c:207: warning: Function parameter or member 'p3' not described in 'cxl_h_control_function'
 drivers/misc/cxl/hcalls.c:207: warning: Function parameter or member 'p4' not described in 'cxl_h_control_function'
 drivers/misc/cxl/hcalls.c:207: warning: Function parameter or member 'out' not described in 'cxl_h_control_function'
 drivers/misc/cxl/hcalls.c:245: warning: Function parameter or member 'unit_address' not described in 'cxl_h_reset_afu'
 drivers/misc/cxl/hcalls.c:258: warning: Function parameter or member 'unit_address' not described in 'cxl_h_suspend_process'
 drivers/misc/cxl/hcalls.c:258: warning: Function parameter or member 'process_token' not described in 'cxl_h_suspend_process'
 drivers/misc/cxl/hcalls.c:271: warning: Function parameter or member 'unit_address' not described in 'cxl_h_resume_process'
 drivers/misc/cxl/hcalls.c:271: warning: Function parameter or member 'process_token' not described in 'cxl_h_resume_process'
 drivers/misc/cxl/hcalls.c:284: warning: Function parameter or member 'unit_address' not described in 'cxl_h_read_error_state'
 drivers/misc/cxl/hcalls.c:284: warning: Function parameter or member 'state' not described in 'cxl_h_read_error_state'
 drivers/misc/cxl/hcalls.c:300: warning: Function parameter or member 'unit_address' not described in 'cxl_h_get_afu_err'
 drivers/misc/cxl/hcalls.c:300: warning: Function parameter or member 'offset' not described in 'cxl_h_get_afu_err'
 drivers/misc/cxl/hcalls.c:300: warning: Function parameter or member 'buf_address' not described in 'cxl_h_get_afu_err'
 drivers/misc/cxl/hcalls.c:300: warning: Function parameter or member 'len' not described in 'cxl_h_get_afu_err'
 drivers/misc/cxl/hcalls.c:320: warning: Function parameter or member 'unit_address' not described in 'cxl_h_get_config'
 drivers/misc/cxl/hcalls.c:320: warning: Function parameter or member 'cr_num' not described in 'cxl_h_get_config'
 drivers/misc/cxl/hcalls.c:320: warning: Function parameter or member 'offset' not described in 'cxl_h_get_config'
 drivers/misc/cxl/hcalls.c:320: warning: Function parameter or member 'buf_address' not described in 'cxl_h_get_config'
 drivers/misc/cxl/hcalls.c:320: warning: Function parameter or member 'len' not described in 'cxl_h_get_config'
 drivers/misc/cxl/hcalls.c:333: warning: Function parameter or member 'unit_address' not described in 'cxl_h_terminate_process'
 drivers/misc/cxl/hcalls.c:333: warning: Function parameter or member 'process_token' not described in 'cxl_h_terminate_process'
 drivers/misc/cxl/hcalls.c:351: warning: Function parameter or member 'unit_address' not described in 'cxl_h_collect_vpd'
 drivers/misc/cxl/hcalls.c:351: warning: Function parameter or member 'record' not described in 'cxl_h_collect_vpd'
 drivers/misc/cxl/hcalls.c:351: warning: Function parameter or member 'list_address' not described in 'cxl_h_collect_vpd'
 drivers/misc/cxl/hcalls.c:351: warning: Function parameter or member 'num' not described in 'cxl_h_collect_vpd'
 drivers/misc/cxl/hcalls.c:351: warning: Function parameter or member 'out' not described in 'cxl_h_collect_vpd'
 drivers/misc/cxl/hcalls.c:362: warning: Function parameter or member 'unit_address' not described in 'cxl_h_get_fn_error_interrupt'
 drivers/misc/cxl/hcalls.c:362: warning: Function parameter or member 'reg' not described in 'cxl_h_get_fn_error_interrupt'
 drivers/misc/cxl/hcalls.c:374: warning: Function parameter or member 'unit_address' not described in 'cxl_h_ack_fn_error_interrupt'
 drivers/misc/cxl/hcalls.c:374: warning: Function parameter or member 'value' not described in 'cxl_h_ack_fn_error_interrupt'
 drivers/misc/cxl/hcalls.c:386: warning: Function parameter or member 'unit_address' not described in 'cxl_h_get_error_log'
 drivers/misc/cxl/hcalls.c:386: warning: Function parameter or member 'value' not described in 'cxl_h_get_error_log'
 drivers/misc/cxl/hcalls.c:399: warning: Function parameter or member 'unit_address' not described in 'cxl_h_collect_int_info'
 drivers/misc/cxl/hcalls.c:399: warning: Function parameter or member 'process_token' not described in 'cxl_h_collect_int_info'
 drivers/misc/cxl/hcalls.c:399: warning: Function parameter or member 'info' not described in 'cxl_h_collect_int_info'
 drivers/misc/cxl/hcalls.c:440: warning: Function parameter or member 'unit_address' not described in 'cxl_h_control_faults'
 drivers/misc/cxl/hcalls.c:440: warning: Function parameter or member 'process_token' not described in 'cxl_h_control_faults'
 drivers/misc/cxl/hcalls.c:440: warning: Function parameter or member 'control_mask' not described in 'cxl_h_control_faults'
 drivers/misc/cxl/hcalls.c:440: warning: Function parameter or member 'reset_mask' not described in 'cxl_h_control_faults'
 drivers/misc/cxl/hcalls.c:480: warning: Function parameter or member 'unit_address' not described in 'cxl_h_control_facility'
 drivers/misc/cxl/hcalls.c:480: warning: Function parameter or member 'op' not described in 'cxl_h_control_facility'
 drivers/misc/cxl/hcalls.c:480: warning: Function parameter or member 'p1' not described in 'cxl_h_control_facility'
 drivers/misc/cxl/hcalls.c:480: warning: Function parameter or member 'p2' not described in 'cxl_h_control_facility'
 drivers/misc/cxl/hcalls.c:480: warning: Function parameter or member 'p3' not described in 'cxl_h_control_facility'
 drivers/misc/cxl/hcalls.c:480: warning: Function parameter or member 'p4' not described in 'cxl_h_control_facility'
 drivers/misc/cxl/hcalls.c:480: warning: Function parameter or member 'out' not described in 'cxl_h_control_facility'
 drivers/misc/cxl/hcalls.c:516: warning: Function parameter or member 'unit_address' not described in 'cxl_h_reset_adapter'
 drivers/misc/cxl/hcalls.c:532: warning: Function parameter or member 'unit_address' not described in 'cxl_h_collect_vpd_adapter'
 drivers/misc/cxl/hcalls.c:532: warning: Function parameter or member 'list_address' not described in 'cxl_h_collect_vpd_adapter'
 drivers/misc/cxl/hcalls.c:532: warning: Function parameter or member 'num' not described in 'cxl_h_collect_vpd_adapter'
 drivers/misc/cxl/hcalls.c:532: warning: Function parameter or member 'out' not described in 'cxl_h_collect_vpd_adapter'
 drivers/misc/cxl/hcalls.c:561: warning: Function parameter or member 'unit_address' not described in 'cxl_h_download_facility'
 drivers/misc/cxl/hcalls.c:561: warning: Function parameter or member 'op' not described in 'cxl_h_download_facility'
 drivers/misc/cxl/hcalls.c:561: warning: Function parameter or member 'list_address' not described in 'cxl_h_download_facility'
 drivers/misc/cxl/hcalls.c:561: warning: Function parameter or member 'num' not described in 'cxl_h_download_facility'
 drivers/misc/cxl/hcalls.c:561: warning: Function parameter or member 'out' not described in 'cxl_h_download_facility'
 drivers/misc/cxl/hcalls.c:626: warning: Function parameter or member 'unit_address' not described in 'cxl_h_download_adapter_image'
 drivers/misc/cxl/hcalls.c:626: warning: Function parameter or member 'list_address' not described in 'cxl_h_download_adapter_image'
 drivers/misc/cxl/hcalls.c:626: warning: Function parameter or member 'num' not described in 'cxl_h_download_adapter_image'
 drivers/misc/cxl/hcalls.c:626: warning: Function parameter or member 'out' not described in 'cxl_h_download_adapter_image'
 drivers/misc/cxl/hcalls.c:639: warning: Function parameter or member 'unit_address' not described in 'cxl_h_validate_adapter_image'
 drivers/misc/cxl/hcalls.c:639: warning: Function parameter or member 'list_address' not described in 'cxl_h_validate_adapter_image'
 drivers/misc/cxl/hcalls.c:639: warning: Function parameter or member 'num' not described in 'cxl_h_validate_adapter_image'

Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/misc/cxl/hcalls.c | 42 +++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/misc/cxl/hcalls.c b/drivers/misc/cxl/hcalls.c
index b7c57f67f4f52..aba5e20eeb1f5 100644
--- a/drivers/misc/cxl/hcalls.c
+++ b/drivers/misc/cxl/hcalls.c
@@ -167,7 +167,7 @@ long cxl_h_attach_process(u64 unit_address,
 	}
 }
 
-/**
+/*
  * cxl_h_detach_process - Detach a process element from a coherent
  *                        platform function.
  */
@@ -197,7 +197,7 @@ long cxl_h_detach_process(u64 unit_address, u64 process_token)
 	}
 }
 
-/**
+/*
  * cxl_h_control_function - This H_CONTROL_CA_FUNCTION hypervisor call allows
  *                          the partition to manipulate or query
  *                          certain coherent platform function behaviors.
@@ -238,7 +238,7 @@ static long cxl_h_control_function(u64 unit_address, u64 op,
 	}
 }
 
-/**
+/*
  * cxl_h_reset_afu - Perform a reset to the coherent platform function.
  */
 long cxl_h_reset_afu(u64 unit_address)
@@ -249,7 +249,7 @@ long cxl_h_reset_afu(u64 unit_address)
 				NULL);
 }
 
-/**
+/*
  * cxl_h_suspend_process - Suspend a process from being executed
  * Parameter1 = process-token as returned from H_ATTACH_CA_PROCESS when
  *              process was attached.
@@ -262,7 +262,7 @@ long cxl_h_suspend_process(u64 unit_address, u64 process_token)
 				NULL);
 }
 
-/**
+/*
  * cxl_h_resume_process - Resume a process to be executed
  * Parameter1 = process-token as returned from H_ATTACH_CA_PROCESS when
  *              process was attached.
@@ -275,7 +275,7 @@ long cxl_h_resume_process(u64 unit_address, u64 process_token)
 				NULL);
 }
 
-/**
+/*
  * cxl_h_read_error_state - Checks the error state of the coherent
  *                          platform function.
  * R4 contains the error state
@@ -288,7 +288,7 @@ long cxl_h_read_error_state(u64 unit_address, u64 *state)
 				state);
 }
 
-/**
+/*
  * cxl_h_get_afu_err - collect the AFU error buffer
  * Parameter1 = byte offset into error buffer to retrieve, valid values
  *              are between 0 and (ibm,error-buffer-size - 1)
@@ -304,7 +304,7 @@ long cxl_h_get_afu_err(u64 unit_address, u64 offset,
 				NULL);
 }
 
-/**
+/*
  * cxl_h_get_config - collect configuration record for the
  *                    coherent platform function
  * Parameter1 = # of configuration record to retrieve, valid values are
@@ -324,7 +324,7 @@ long cxl_h_get_config(u64 unit_address, u64 cr_num, u64 offset,
 				NULL);
 }
 
-/**
+/*
  * cxl_h_terminate_process - Terminate the process before completion
  * Parameter1 = process-token as returned from H_ATTACH_CA_PROCESS when
  *              process was attached.
@@ -337,7 +337,7 @@ long cxl_h_terminate_process(u64 unit_address, u64 process_token)
 				NULL);
 }
 
-/**
+/*
  * cxl_h_collect_vpd - Collect VPD for the coherent platform function.
  * Parameter1 = # of VPD record to retrieve, valid values are between 0
  *              and (ibm,#config-records - 1).
@@ -355,7 +355,7 @@ long cxl_h_collect_vpd(u64 unit_address, u64 record, u64 list_address,
 				out);
 }
 
-/**
+/*
  * cxl_h_get_fn_error_interrupt - Read the function-wide error data based on an interrupt
  */
 long cxl_h_get_fn_error_interrupt(u64 unit_address, u64 *reg)
@@ -365,7 +365,7 @@ long cxl_h_get_fn_error_interrupt(u64 unit_address, u64 *reg)
 				0, 0, 0, 0, reg);
 }
 
-/**
+/*
  * cxl_h_ack_fn_error_interrupt - Acknowledge function-wide error data
  *                                based on an interrupt
  * Parameter1 = value to write to the function-wide error interrupt register
@@ -378,7 +378,7 @@ long cxl_h_ack_fn_error_interrupt(u64 unit_address, u64 value)
 				NULL);
 }
 
-/**
+/*
  * cxl_h_get_error_log - Retrieve the Platform Log ID (PLID) of
  *                       an error log
  */
@@ -390,7 +390,7 @@ long cxl_h_get_error_log(u64 unit_address, u64 value)
 				NULL);
 }
 
-/**
+/*
  * cxl_h_collect_int_info - Collect interrupt info about a coherent
  *                          platform function after an interrupt occurred.
  */
@@ -425,7 +425,7 @@ long cxl_h_collect_int_info(u64 unit_address, u64 process_token,
 	}
 }
 
-/**
+/*
  * cxl_h_control_faults - Control the operation of a coherent platform
  *                        function after a fault occurs.
  *
@@ -470,7 +470,7 @@ long cxl_h_control_faults(u64 unit_address, u64 process_token,
 	}
 }
 
-/**
+/*
  * cxl_h_control_facility - This H_CONTROL_CA_FACILITY hypervisor call
  *                          allows the partition to manipulate or query
  *                          certain coherent platform facility behaviors.
@@ -509,7 +509,7 @@ static long cxl_h_control_facility(u64 unit_address, u64 op,
 	}
 }
 
-/**
+/*
  * cxl_h_reset_adapter - Perform a reset to the coherent platform facility.
  */
 long cxl_h_reset_adapter(u64 unit_address)
@@ -520,7 +520,7 @@ long cxl_h_reset_adapter(u64 unit_address)
 				NULL);
 }
 
-/**
+/*
  * cxl_h_collect_vpd - Collect VPD for the coherent platform function.
  * Parameter1 = 4K naturally aligned real buffer containing block
  *              list entries
@@ -536,7 +536,7 @@ long cxl_h_collect_vpd_adapter(u64 unit_address, u64 list_address,
 				out);
 }
 
-/**
+/*
  * cxl_h_download_facility - This H_DOWNLOAD_CA_FACILITY
  *                    hypervisor call provide platform support for
  *                    downloading a base adapter image to the coherent
@@ -616,7 +616,7 @@ static long cxl_h_download_facility(u64 unit_address, u64 op,
 	}
 }
 
-/**
+/*
  * cxl_h_download_adapter_image - Download the base image to the coherent
  *                                platform facility.
  */
@@ -629,7 +629,7 @@ long cxl_h_download_adapter_image(u64 unit_address,
 				       list_address, num, out);
 }
 
-/**
+/*
  * cxl_h_validate_adapter_image - Validate the base image in the coherent
  *                                platform facility.
  */
-- 
2.25.1

