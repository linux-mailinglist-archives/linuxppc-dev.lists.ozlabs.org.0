Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41496925D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:54:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2w64JBQz3fBC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:54:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tqyTzbKL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tqyTzbKL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2dy5JWTz3f3g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCA2061E9C;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD8DAC433D2;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054528;
	bh=ttgySmQ6wQHmMtOZEVWFHG2Ul2XdhFDbB56+La+RM1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tqyTzbKLVKWhimehcbMBYcSqv7klYEKmbwPfXxkhu2eMR71ghQ9CbNJVzkyJUO3+z
	 Grt9ayJi2sJiONNRckIozNvd7KxUkiyiIIRjVkzroTklYiHgS/pRLxQpQ6Q7IXQ+6z
	 fBh6TGsGJr4tzlyFuc0CKLolrZ0+mkS126pHhZCGvqWMFSylWgPqQp1hLzRInnnjUH
	 UyLZtFmTmavtK9kvSBa32xnQeNTEplRGcGPpwpVDl0ovN+eUEsftEtWPIPj24j7ZnR
	 XmNo4MNd+X98QgMPhIpCtu3QQfBJV8OXzvF4tQFMLlo5p5jGrUNdD9jz1BzjGjAVCQ
	 lBJ3zGUvUGevg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3A8C64EC7;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 12:42:07 -0600
Subject: [PATCH v3 19/20] powerpc/rtas: introduce rtas_function_token() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-19-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=11999;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=8ic7NF5qrgOSgzcSDGNkk6csQhWpdydQPpOZ8jfpsig=;
 b=JChRuvaXzpMIYUi13zwgwvPxeQSWIdb417YMiMCbxlsoP23CpxivGPOGH1HLTN38RzK7IzlwH
 SpCAgAyqICmBvsx829tw1m2Qn2GmshD8fhk+jrRcqlvDCOr17RFiyz/
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Submission Endpoint for nathanl@linux.ibm.com/20230206 with auth_id=27
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Users of rtas_token() supply a string argument that can't be validated
at build time. A typo or misspelling has to be caught by inspection or
by observing wrong behavior at runtime.

Since the core RTAS code now has consolidated the names of all
possible RTAS functions and mapped them to their tokens, token lookup
can be implemented using symbolic constants to index a static array.

So introduce rtas_function_token(), a replacement API which does that,
along with a rtas_service_present()-equivalent helper,
rtas_function_implemented(). Callers supply an opaque predefined
function handle which is used internally to index the function
table. Typos or other inappropriate arguments yield build errors, and
the function handle is a type that can't be easily confused with RTAS
tokens or other integer types.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h | 99 +++++++++++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/rtas.c      | 28 +++++++++++-
 2 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index f03891891a2d..3abe15ac79db 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -101,6 +101,100 @@ enum rtas_function_index {
 	RTAS_FNIDX__WRITE_PCI_CONFIG,
 };
 
+/*
+ * Opaque handle for client code to refer to RTAS functions. All valid
+ * function handles are build-time constants prefixed with RTAS_FN_.
+ */
+typedef struct {
+	const enum rtas_function_index index;
+} rtas_fn_handle_t;
+
+
+#define rtas_fn_handle(x_) ((const rtas_fn_handle_t) { .index = x_, })
+
+#define RTAS_FN_CHECK_EXCEPTION                   rtas_fn_handle(RTAS_FNIDX__CHECK_EXCEPTION)
+#define RTAS_FN_DISPLAY_CHARACTER                 rtas_fn_handle(RTAS_FNIDX__DISPLAY_CHARACTER)
+#define RTAS_FN_EVENT_SCAN                        rtas_fn_handle(RTAS_FNIDX__EVENT_SCAN)
+#define RTAS_FN_FREEZE_TIME_BASE                  rtas_fn_handle(RTAS_FNIDX__FREEZE_TIME_BASE)
+#define RTAS_FN_GET_POWER_LEVEL                   rtas_fn_handle(RTAS_FNIDX__GET_POWER_LEVEL)
+#define RTAS_FN_GET_SENSOR_STATE                  rtas_fn_handle(RTAS_FNIDX__GET_SENSOR_STATE)
+#define RTAS_FN_GET_TERM_CHAR                     rtas_fn_handle(RTAS_FNIDX__GET_TERM_CHAR)
+#define RTAS_FN_GET_TIME_OF_DAY                   rtas_fn_handle(RTAS_FNIDX__GET_TIME_OF_DAY)
+#define RTAS_FN_IBM_ACTIVATE_FIRMWARE             rtas_fn_handle(RTAS_FNIDX__IBM_ACTIVATE_FIRMWARE)
+#define RTAS_FN_IBM_CBE_START_PTCAL               rtas_fn_handle(RTAS_FNIDX__IBM_CBE_START_PTCAL)
+#define RTAS_FN_IBM_CBE_STOP_PTCAL                rtas_fn_handle(RTAS_FNIDX__IBM_CBE_STOP_PTCAL)
+#define RTAS_FN_IBM_CHANGE_MSI                    rtas_fn_handle(RTAS_FNIDX__IBM_CHANGE_MSI)
+#define RTAS_FN_IBM_CLOSE_ERRINJCT                rtas_fn_handle(RTAS_FNIDX__IBM_CLOSE_ERRINJCT)
+#define RTAS_FN_IBM_CONFIGURE_BRIDGE              rtas_fn_handle(RTAS_FNIDX__IBM_CONFIGURE_BRIDGE)
+#define RTAS_FN_IBM_CONFIGURE_CONNECTOR           rtas_fn_handle(RTAS_FNIDX__IBM_CONFIGURE_CONNECTOR)
+#define RTAS_FN_IBM_CONFIGURE_KERNEL_DUMP         rtas_fn_handle(RTAS_FNIDX__IBM_CONFIGURE_KERNEL_DUMP)
+#define RTAS_FN_IBM_CONFIGURE_PE                  rtas_fn_handle(RTAS_FNIDX__IBM_CONFIGURE_PE)
+#define RTAS_FN_IBM_CREATE_PE_DMA_WINDOW          rtas_fn_handle(RTAS_FNIDX__IBM_CREATE_PE_DMA_WINDOW)
+#define RTAS_FN_IBM_DISPLAY_MESSAGE               rtas_fn_handle(RTAS_FNIDX__IBM_DISPLAY_MESSAGE)
+#define RTAS_FN_IBM_ERRINJCT                      rtas_fn_handle(RTAS_FNIDX__IBM_ERRINJCT)
+#define RTAS_FN_IBM_EXTI2C                        rtas_fn_handle(RTAS_FNIDX__IBM_EXTI2C)
+#define RTAS_FN_IBM_GET_CONFIG_ADDR_INFO          rtas_fn_handle(RTAS_FNIDX__IBM_GET_CONFIG_ADDR_INFO)
+#define RTAS_FN_IBM_GET_CONFIG_ADDR_INFO2         rtas_fn_handle(RTAS_FNIDX__IBM_GET_CONFIG_ADDR_INFO2)
+#define RTAS_FN_IBM_GET_DYNAMIC_SENSOR_STATE      rtas_fn_handle(RTAS_FNIDX__IBM_GET_DYNAMIC_SENSOR_STATE)
+#define RTAS_FN_IBM_GET_INDICES                   rtas_fn_handle(RTAS_FNIDX__IBM_GET_INDICES)
+#define RTAS_FN_IBM_GET_RIO_TOPOLOGY              rtas_fn_handle(RTAS_FNIDX__IBM_GET_RIO_TOPOLOGY)
+#define RTAS_FN_IBM_GET_SYSTEM_PARAMETER          rtas_fn_handle(RTAS_FNIDX__IBM_GET_SYSTEM_PARAMETER)
+#define RTAS_FN_IBM_GET_VPD                       rtas_fn_handle(RTAS_FNIDX__IBM_GET_VPD)
+#define RTAS_FN_IBM_GET_XIVE                      rtas_fn_handle(RTAS_FNIDX__IBM_GET_XIVE)
+#define RTAS_FN_IBM_INT_OFF                       rtas_fn_handle(RTAS_FNIDX__IBM_INT_OFF)
+#define RTAS_FN_IBM_INT_ON                        rtas_fn_handle(RTAS_FNIDX__IBM_INT_ON)
+#define RTAS_FN_IBM_IO_QUIESCE_ACK                rtas_fn_handle(RTAS_FNIDX__IBM_IO_QUIESCE_ACK)
+#define RTAS_FN_IBM_LPAR_PERFTOOLS                rtas_fn_handle(RTAS_FNIDX__IBM_LPAR_PERFTOOLS)
+#define RTAS_FN_IBM_MANAGE_FLASH_IMAGE            rtas_fn_handle(RTAS_FNIDX__IBM_MANAGE_FLASH_IMAGE)
+#define RTAS_FN_IBM_MANAGE_STORAGE_PRESERVATION   rtas_fn_handle(RTAS_FNIDX__IBM_MANAGE_STORAGE_PRESERVATION)
+#define RTAS_FN_IBM_NMI_INTERLOCK                 rtas_fn_handle(RTAS_FNIDX__IBM_NMI_INTERLOCK)
+#define RTAS_FN_IBM_NMI_REGISTER                  rtas_fn_handle(RTAS_FNIDX__IBM_NMI_REGISTER)
+#define RTAS_FN_IBM_OPEN_ERRINJCT                 rtas_fn_handle(RTAS_FNIDX__IBM_OPEN_ERRINJCT)
+#define RTAS_FN_IBM_OPEN_SRIOV_ALLOW_UNFREEZE     rtas_fn_handle(RTAS_FNIDX__IBM_OPEN_SRIOV_ALLOW_UNFREEZE)
+#define RTAS_FN_IBM_OPEN_SRIOV_MAP_PE_NUMBER      rtas_fn_handle(RTAS_FNIDX__IBM_OPEN_SRIOV_MAP_PE_NUMBER)
+#define RTAS_FN_IBM_OS_TERM                       rtas_fn_handle(RTAS_FNIDX__IBM_OS_TERM)
+#define RTAS_FN_IBM_PARTNER_CONTROL               rtas_fn_handle(RTAS_FNIDX__IBM_PARTNER_CONTROL)
+#define RTAS_FN_IBM_PHYSICAL_ATTESTATION          rtas_fn_handle(RTAS_FNIDX__IBM_PHYSICAL_ATTESTATION)
+#define RTAS_FN_IBM_PLATFORM_DUMP                 rtas_fn_handle(RTAS_FNIDX__IBM_PLATFORM_DUMP)
+#define RTAS_FN_IBM_POWER_OFF_UPS                 rtas_fn_handle(RTAS_FNIDX__IBM_POWER_OFF_UPS)
+#define RTAS_FN_IBM_QUERY_INTERRUPT_SOURCE_NUMBER rtas_fn_handle(RTAS_FNIDX__IBM_QUERY_INTERRUPT_SOURCE_NUMBER)
+#define RTAS_FN_IBM_QUERY_PE_DMA_WINDOW           rtas_fn_handle(RTAS_FNIDX__IBM_QUERY_PE_DMA_WINDOW)
+#define RTAS_FN_IBM_READ_PCI_CONFIG               rtas_fn_handle(RTAS_FNIDX__IBM_READ_PCI_CONFIG)
+#define RTAS_FN_IBM_READ_SLOT_RESET_STATE         rtas_fn_handle(RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE)
+#define RTAS_FN_IBM_READ_SLOT_RESET_STATE2        rtas_fn_handle(RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE2)
+#define RTAS_FN_IBM_REMOVE_PE_DMA_WINDOW          rtas_fn_handle(RTAS_FNIDX__IBM_REMOVE_PE_DMA_WINDOW)
+#define RTAS_FN_IBM_RESET_PE_DMA_WINDOWS          rtas_fn_handle(RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOWS)
+#define RTAS_FN_IBM_SCAN_LOG_DUMP                 rtas_fn_handle(RTAS_FNIDX__IBM_SCAN_LOG_DUMP)
+#define RTAS_FN_IBM_SET_DYNAMIC_INDICATOR         rtas_fn_handle(RTAS_FNIDX__IBM_SET_DYNAMIC_INDICATOR)
+#define RTAS_FN_IBM_SET_EEH_OPTION                rtas_fn_handle(RTAS_FNIDX__IBM_SET_EEH_OPTION)
+#define RTAS_FN_IBM_SET_SLOT_RESET                rtas_fn_handle(RTAS_FNIDX__IBM_SET_SLOT_RESET)
+#define RTAS_FN_IBM_SET_SYSTEM_PARAMETER          rtas_fn_handle(RTAS_FNIDX__IBM_SET_SYSTEM_PARAMETER)
+#define RTAS_FN_IBM_SET_XIVE                      rtas_fn_handle(RTAS_FNIDX__IBM_SET_XIVE)
+#define RTAS_FN_IBM_SLOT_ERROR_DETAIL             rtas_fn_handle(RTAS_FNIDX__IBM_SLOT_ERROR_DETAIL)
+#define RTAS_FN_IBM_SUSPEND_ME                    rtas_fn_handle(RTAS_FNIDX__IBM_SUSPEND_ME)
+#define RTAS_FN_IBM_TUNE_DMA_PARMS                rtas_fn_handle(RTAS_FNIDX__IBM_TUNE_DMA_PARMS)
+#define RTAS_FN_IBM_UPDATE_FLASH_64_AND_REBOOT    rtas_fn_handle(RTAS_FNIDX__IBM_UPDATE_FLASH_64_AND_REBOOT)
+#define RTAS_FN_IBM_UPDATE_NODES                  rtas_fn_handle(RTAS_FNIDX__IBM_UPDATE_NODES)
+#define RTAS_FN_IBM_UPDATE_PROPERTIES             rtas_fn_handle(RTAS_FNIDX__IBM_UPDATE_PROPERTIES)
+#define RTAS_FN_IBM_VALIDATE_FLASH_IMAGE          rtas_fn_handle(RTAS_FNIDX__IBM_VALIDATE_FLASH_IMAGE)
+#define RTAS_FN_IBM_WRITE_PCI_CONFIG              rtas_fn_handle(RTAS_FNIDX__IBM_WRITE_PCI_CONFIG)
+#define RTAS_FN_NVRAM_FETCH                       rtas_fn_handle(RTAS_FNIDX__NVRAM_FETCH)
+#define RTAS_FN_NVRAM_STORE                       rtas_fn_handle(RTAS_FNIDX__NVRAM_STORE)
+#define RTAS_FN_POWER_OFF                         rtas_fn_handle(RTAS_FNIDX__POWER_OFF)
+#define RTAS_FN_PUT_TERM_CHAR                     rtas_fn_handle(RTAS_FNIDX__PUT_TERM_CHAR)
+#define RTAS_FN_QUERY_CPU_STOPPED_STATE           rtas_fn_handle(RTAS_FNIDX__QUERY_CPU_STOPPED_STATE)
+#define RTAS_FN_READ_PCI_CONFIG                   rtas_fn_handle(RTAS_FNIDX__READ_PCI_CONFIG)
+#define RTAS_FN_RTAS_LAST_ERROR                   rtas_fn_handle(RTAS_FNIDX__RTAS_LAST_ERROR)
+#define RTAS_FN_SET_INDICATOR                     rtas_fn_handle(RTAS_FNIDX__SET_INDICATOR)
+#define RTAS_FN_SET_POWER_LEVEL                   rtas_fn_handle(RTAS_FNIDX__SET_POWER_LEVEL)
+#define RTAS_FN_SET_TIME_FOR_POWER_ON             rtas_fn_handle(RTAS_FNIDX__SET_TIME_FOR_POWER_ON)
+#define RTAS_FN_SET_TIME_OF_DAY                   rtas_fn_handle(RTAS_FNIDX__SET_TIME_OF_DAY)
+#define RTAS_FN_START_CPU                         rtas_fn_handle(RTAS_FNIDX__START_CPU)
+#define RTAS_FN_STOP_SELF                         rtas_fn_handle(RTAS_FNIDX__STOP_SELF)
+#define RTAS_FN_SYSTEM_REBOOT                     rtas_fn_handle(RTAS_FNIDX__SYSTEM_REBOOT)
+#define RTAS_FN_THAW_TIME_BASE                    rtas_fn_handle(RTAS_FNIDX__THAW_TIME_BASE)
+#define RTAS_FN_WRITE_PCI_CONFIG                  rtas_fn_handle(RTAS_FNIDX__WRITE_PCI_CONFIG)
+
 #define RTAS_UNKNOWN_SERVICE (-1)
 #define RTAS_INSTANTIATE_MAX (1ULL<<30) /* Don't instantiate rtas at/above this value */
 
@@ -307,6 +401,11 @@ extern void (*rtas_flash_term_hook)(int);
 
 extern struct rtas_t rtas;
 
+s32 rtas_function_token(const rtas_fn_handle_t handle);
+static inline bool rtas_function_implemented(const rtas_fn_handle_t handle)
+{
+	return rtas_function_token(handle) != RTAS_UNKNOWN_SERVICE;
+}
 extern int rtas_token(const char *service);
 extern int rtas_service_present(const char *service);
 extern int rtas_call(int token, int, int, int *, ...);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 1f80f0b8a9ad..bb6f5370c279 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -453,6 +453,32 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 	},
 };
 
+/**
+ * rtas_function_token() - RTAS function token lookup.
+ * @handle: Function handle, e.g. RTAS_FN_EVENT_SCAN.
+ *
+ * Context: Any context.
+ * Return: the token value for the function if implemented by this platform,
+ *         otherwise RTAS_UNKNOWN_SERVICE.
+ */
+s32 rtas_function_token(const rtas_fn_handle_t handle)
+{
+	const size_t index = handle.index;
+	const bool out_of_bounds = index >= ARRAY_SIZE(rtas_function_table);
+
+	if (WARN_ONCE(out_of_bounds, "invalid function index %zu", index))
+		return RTAS_UNKNOWN_SERVICE;
+	/*
+	 * Various drivers attempt token lookups on non-RTAS
+	 * platforms.
+	 */
+	if (!rtas.dev)
+		return RTAS_UNKNOWN_SERVICE;
+
+	return rtas_function_table[index].token;
+}
+EXPORT_SYMBOL_GPL(rtas_function_token);
+
 static int rtas_function_cmp(const void *a, const void *b)
 {
 	const struct rtas_function *f1 = a;
@@ -1011,7 +1037,7 @@ static int ibm_errinjct_token;
  * @....: List of @nargs input parameters.
  *
  * Invokes the RTAS function indicated by @token, which the caller
- * should obtain via rtas_token().
+ * should obtain via rtas_function_token().
  *
  * The @nargs and @nret arguments must match the number of input and
  * output parameters specified for the RTAS function.

-- 
2.39.1

