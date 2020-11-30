Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EAF2C8F54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 21:41:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClHF75dpHzDr6Q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 07:40:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sa9B+85k; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl84163hNzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:17:37 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AUF4XnE150160; Mon, 30 Nov 2020 10:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=q4qOxUv82Vlz1okT0uQaPo+5wm5xH7ihGdQ6JZq/NVw=;
 b=sa9B+85k6OQFdif2AXmPQXwYJKy5+Ga/GTAOIcy+eFImMsHzG3l3nY2p8SXe1VBossCi
 5/uwqEshKZ6DuS6XJ5av1Qco0O3y10AWOcfLZKs505nysh22BsxgZnjS54J9n7NwmHHq
 rH73XtLEaNmkTkqnhdVwSMvpf7uG6L3lcnRi7NPhjMkZVmupe1I5IXyXBz2vSYqnAoVF
 YHUpBzSt8ssqX4S7phPS2lMPbGOiSbsUpbFQrKGmiW666k5ehm46W8fBtYmCp8d83636
 bkejM1S4DbpuQwQVL1F5NJJm5FNQaS9ihZE+r0oS6Tahx+TFhFUTO9lyheBP+6UthzbB 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3551674ekk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 10:17:32 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AUF4mRx151516;
 Mon, 30 Nov 2020 10:17:32 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3551674ejk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 10:17:32 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AUF89Cp023688;
 Mon, 30 Nov 2020 15:17:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 353e6825cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 15:17:29 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AUFHRZR6161056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 15:17:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F5A75204F;
 Mon, 30 Nov 2020 15:17:27 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9B45452051;
 Mon, 30 Nov 2020 15:17:25 +0000 (GMT)
Subject: [RFC Qemu PATCH v2 2/2] spapr: nvdimm: Implement async flush hcalls
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: xiaoguangrong.eric@gmail.com, mst@redhat.com, imammedo@redhat.com,
 david@gibson.dropbear.id.au, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Date: Mon, 30 Nov 2020 09:17:24 -0600
Message-ID: <160674940727.2492771.7855399693883710135.stgit@lep8c.aus.stglabs.ibm.com>
In-Reply-To: <160674929554.2492771.17651548703390170573.stgit@lep8c.aus.stglabs.ibm.com>
References: <160674929554.2492771.17651548703390170573.stgit@lep8c.aus.stglabs.ibm.com>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_05:2020-11-30,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=2 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300094
X-Mailman-Approved-At: Tue, 01 Dec 2020 07:36:04 +1100
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
Cc: linux-nvdimm@lists.01.org, aneesh.kumar@linux.ibm.com,
 kvm-ppc@vger.kernel.org, shivaprasadbhat@gmail.com, bharata@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When the persistent memory beacked by a file, a cpu cache flush instruction
is not sufficient to ensure the stores are correctly flushed to the media.

The patch implements the async hcalls for flush operation on demand from the
guest kernel.

The device option sync-dax is by default off and enables explicit asynchronous
flush requests from guest. It can be disabled by setting syn-dax=on.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 hw/mem/nvdimm.c         |    1 +
 hw/ppc/spapr_nvdimm.c   |   79 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/mem/nvdimm.h |   10 ++++++
 include/hw/ppc/spapr.h  |    3 +-
 4 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 03c2201b56..37a4db0135 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -220,6 +220,7 @@ static void nvdimm_write_label_data(NVDIMMDevice *nvdimm, const void *buf,
 
 static Property nvdimm_properties[] = {
     DEFINE_PROP_BOOL(NVDIMM_UNARMED_PROP, NVDIMMDevice, unarmed, false),
+    DEFINE_PROP_BOOL(NVDIMM_SYNC_DAX_PROP, NVDIMMDevice, sync_dax, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index a833a63b5e..557e36aa98 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "hw/ppc/spapr_drc.h"
 #include "hw/ppc/spapr_nvdimm.h"
@@ -155,6 +156,11 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr, void *fdt,
                              "operating-system")));
     _FDT(fdt_setprop(fdt, child_offset, "ibm,cache-flush-required", NULL, 0));
 
+    if (!nvdimm->sync_dax) {
+        _FDT(fdt_setprop(fdt, child_offset, "ibm,async-flush-required",
+                         NULL, 0));
+    }
+
     return child_offset;
 }
 
@@ -370,6 +376,78 @@ static target_ulong h_scm_bind_mem(PowerPCCPU *cpu, SpaprMachineState *spapr,
     return H_SUCCESS;
 }
 
+typedef struct SCMAsyncFlushData {
+    int fd;
+    uint64_t token;
+} SCMAsyncFlushData;
+
+static int flush_worker_cb(void *opaque)
+{
+    int ret = H_SUCCESS;
+    SCMAsyncFlushData *req_data = opaque;
+
+    /* flush raw backing image */
+    if (qemu_fdatasync(req_data->fd) < 0) {
+        error_report("papr_scm: Could not sync nvdimm to backend file: %s",
+                     strerror(errno));
+        ret = H_HARDWARE;
+    }
+
+    g_free(req_data);
+
+    return ret;
+}
+
+static target_ulong h_scm_async_flush(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                                      target_ulong opcode, target_ulong *args)
+{
+    int ret;
+    uint32_t drc_index = args[0];
+    uint64_t continue_token = args[1];
+    SpaprDrc *drc = spapr_drc_by_index(drc_index);
+    PCDIMMDevice *dimm;
+    HostMemoryBackend *backend = NULL;
+    SCMAsyncFlushData *req_data = NULL;
+
+    if (!drc || !drc->dev ||
+        spapr_drc_type(drc) != SPAPR_DR_CONNECTOR_TYPE_PMEM) {
+        return H_PARAMETER;
+    }
+
+    if (continue_token != 0) {
+        ret = spapr_drc_get_async_hcall_status(drc, continue_token);
+        if (ret == H_BUSY) {
+            args[0] = continue_token;
+            return H_LONG_BUSY_ORDER_1_SEC;
+        }
+
+        return ret;
+    }
+
+    dimm = PC_DIMM(drc->dev);
+    backend = MEMORY_BACKEND(dimm->hostmem);
+
+    req_data = g_malloc0(sizeof(SCMAsyncFlushData));
+    req_data->fd = memory_region_get_fd(&backend->mr);
+
+    continue_token = spapr_drc_get_new_async_hcall_token(drc);
+    if (!continue_token) {
+        g_free(req_data);
+        return H_P2;
+    }
+    req_data->token = continue_token;
+
+    spapr_drc_run_async_hcall(drc, continue_token, &flush_worker_cb, req_data);
+
+    ret = spapr_drc_get_async_hcall_status(drc, continue_token);
+    if (ret == H_BUSY) {
+        args[0] = req_data->token;
+        return ret;
+    }
+
+    return ret;
+}
+
 static target_ulong h_scm_unbind_mem(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                      target_ulong opcode, target_ulong *args)
 {
@@ -486,6 +564,7 @@ static void spapr_scm_register_types(void)
     spapr_register_hypercall(H_SCM_BIND_MEM, h_scm_bind_mem);
     spapr_register_hypercall(H_SCM_UNBIND_MEM, h_scm_unbind_mem);
     spapr_register_hypercall(H_SCM_UNBIND_ALL, h_scm_unbind_all);
+    spapr_register_hypercall(H_SCM_ASYNC_FLUSH, h_scm_async_flush);
 }
 
 type_init(spapr_scm_register_types)
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index c699842dd0..9e8795766e 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -51,6 +51,7 @@ OBJECT_DECLARE_TYPE(NVDIMMDevice, NVDIMMClass, NVDIMM)
 #define NVDIMM_LABEL_SIZE_PROP "label-size"
 #define NVDIMM_UUID_PROP       "uuid"
 #define NVDIMM_UNARMED_PROP    "unarmed"
+#define NVDIMM_SYNC_DAX_PROP    "sync-dax"
 
 struct NVDIMMDevice {
     /* private */
@@ -85,6 +86,15 @@ struct NVDIMMDevice {
      */
     bool unarmed;
 
+    /*
+     * On PPC64,
+     * The 'off' value results in the async-flush-required property set
+     * in the device tree for pseries machines. When 'off', the guest
+     * initiates explicity flush requests to the backend device ensuring
+     * write persistence.
+     */
+    bool sync_dax;
+
     /*
      * The PPC64 - spapr requires each nvdimm device have a uuid.
      */
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 2e89e36cfb..6d7110b7dc 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -535,8 +535,9 @@ struct SpaprMachineState {
 #define H_SCM_BIND_MEM          0x3EC
 #define H_SCM_UNBIND_MEM        0x3F0
 #define H_SCM_UNBIND_ALL        0x3FC
+#define H_SCM_ASYNC_FLUSH       0x4A0
 
-#define MAX_HCALL_OPCODE        H_SCM_UNBIND_ALL
+#define MAX_HCALL_OPCODE        H_SCM_ASYNC_FLUSH
 
 /* The hcalls above are standardized in PAPR and implemented by pHyp
  * as well.


