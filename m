Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 288C168C67B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 20:12:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9bV86qsvz3ffR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 06:12:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P1m2IsdX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P1m2IsdX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9b616lPrz3cd7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 05:54:33 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7171160FF9;
	Mon,  6 Feb 2023 18:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D291C43444;
	Mon,  6 Feb 2023 18:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675709666;
	bh=BH2rO16NK1kGCpxplVnCh5s4wZJOLCWLGphybq9i7Qg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P1m2IsdXtHkkddj6q1tRjDzxTxixVcw+2V98+qb304KIB5tiwPx7jhHq79m7CBl5v
	 kVrtGOOpbAnyFZ2j32Hz6adOw9LEuozFsszoNO/RjMPT8Wv7NneANOcO/HHebIw1bm
	 AMHMBXsyyB/P5GQ55QYko2fLMu31R8IHcpgVXyT5jx6K9uCIEiW67+ej5gReKJWOu9
	 hnnLgQK6ZVRduVD13bbfzzliOdGKlQoEovZVzp3pa0LD0yGNNlpiiIdDekUDB7nIK3
	 3ftobF6QAOxZAoO+eWGTajzbEabtsqV2mqMWELAcFPuvzP/X920GFWYk2YhglWDSxt
	 vMDhcladyLlcQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBA3C6379F;
	Mon,  6 Feb 2023 18:54:25 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Feb 2023 12:54:35 -0600
Subject: [PATCH v2 19/19] powerpc/rtas: arch-wide function token lookup
 conversions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v2-19-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675709663; l=41899;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=h5FlkNUHdGm7wK4X9ljvMHXUbjMRFmS6Q+v2fEZJkbs=;
 b=nTa8PNeyL4ls9kw/sjSH3c2hFTueCSgWy/3YypfnHxReTMGt2MwA6PbQiLC4vsMvEmWKwfFyY
 86aNNL5mfSWDHCxg98jSYRrK/qn8uhZDCfXo/1Iptd9zINesPRFqjq9
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

With the tokens for all implemented RTAS functions now available via
rtas_function_token(), which is optimal and safe for arbitrary
contexts, there is no need to use rtas_token() or cache its result.

Most conversions are trivial, but a few are worth describing in more
detail:

* Error injection token comparisons for lockdown purposes are
  consolidated into a simple predicate: token_is_restricted_errinjct().

* A couple of special cases in block_rtas_call() do not use
  rtas_token() but perform string comparisons against names in the
  function table. These are converted to compare against token values
  instead, which is logically equivalent but less expensive.

* The lookup for the ibm,os-term token can be deferred until needed,
  instead of caching it at boot to avoid device tree traversal during
  panic.

* Since rtas_function_token() accesses a read-only data structure
  without taking any locks, xmon's lookup of set-indicator can be
  performed as needed instead of cached at startup.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas-proc.c               | 24 ++++----
 arch/powerpc/kernel/rtas-rtc.c                |  6 +-
 arch/powerpc/kernel/rtas.c                    | 79 +++++++++++++--------------
 arch/powerpc/kernel/rtas_flash.c              | 21 ++++---
 arch/powerpc/kernel/rtas_pci.c                |  8 +--
 arch/powerpc/kernel/rtasd.c                   |  2 +-
 arch/powerpc/platforms/52xx/efika.c           |  4 +-
 arch/powerpc/platforms/cell/ras.c             |  4 +-
 arch/powerpc/platforms/cell/smp.c             |  4 +-
 arch/powerpc/platforms/chrp/nvram.c           |  4 +-
 arch/powerpc/platforms/chrp/pci.c             |  4 +-
 arch/powerpc/platforms/chrp/setup.c           |  4 +-
 arch/powerpc/platforms/maple/setup.c          |  4 +-
 arch/powerpc/platforms/pseries/dlpar.c        |  2 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c  | 22 ++++----
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |  4 +-
 arch/powerpc/platforms/pseries/io_event_irq.c |  2 +-
 arch/powerpc/platforms/pseries/mobility.c     |  4 +-
 arch/powerpc/platforms/pseries/msi.c          |  4 +-
 arch/powerpc/platforms/pseries/nvram.c        |  4 +-
 arch/powerpc/platforms/pseries/pci.c          |  2 +-
 arch/powerpc/platforms/pseries/ras.c          |  2 +-
 arch/powerpc/platforms/pseries/setup.c        |  8 +--
 arch/powerpc/platforms/pseries/smp.c          |  6 +-
 arch/powerpc/sysdev/xics/ics-rtas.c           |  8 +--
 arch/powerpc/xmon/xmon.c                      | 16 +-----
 26 files changed, 119 insertions(+), 133 deletions(-)

diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
index 081b2b741a8c..9454b8395b6a 100644
--- a/arch/powerpc/kernel/rtas-proc.c
+++ b/arch/powerpc/kernel/rtas-proc.c
@@ -287,9 +287,9 @@ static ssize_t ppc_rtas_poweron_write(struct file *file,
 
 	rtc_time64_to_tm(nowtime, &tm);
 
-	error = rtas_call(rtas_token("set-time-for-power-on"), 7, 1, NULL, 
-			tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
-			tm.tm_hour, tm.tm_min, tm.tm_sec, 0 /* nano */);
+	error = rtas_call(rtas_function_token(RTAS_FN_SET_TIME_FOR_POWER_ON), 7, 1, NULL,
+			  tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+			  tm.tm_hour, tm.tm_min, tm.tm_sec, 0 /* nano */);
 	if (error)
 		printk(KERN_WARNING "error: setting poweron time returned: %s\n", 
 				ppc_rtas_process_error(error));
@@ -350,9 +350,9 @@ static ssize_t ppc_rtas_clock_write(struct file *file,
 		return error;
 
 	rtc_time64_to_tm(nowtime, &tm);
-	error = rtas_call(rtas_token("set-time-of-day"), 7, 1, NULL, 
-			tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
-			tm.tm_hour, tm.tm_min, tm.tm_sec, 0);
+	error = rtas_call(rtas_function_token(RTAS_FN_SET_TIME_OF_DAY), 7, 1, NULL,
+			  tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+			  tm.tm_hour, tm.tm_min, tm.tm_sec, 0);
 	if (error)
 		printk(KERN_WARNING "error: setting the clock returned: %s\n", 
 				ppc_rtas_process_error(error));
@@ -362,7 +362,7 @@ static ssize_t ppc_rtas_clock_write(struct file *file,
 static int ppc_rtas_clock_show(struct seq_file *m, void *v)
 {
 	int ret[8];
-	int error = rtas_call(rtas_token("get-time-of-day"), 0, 8, ret);
+	int error = rtas_call(rtas_function_token(RTAS_FN_GET_TIME_OF_DAY), 0, 8, ret);
 
 	if (error) {
 		printk(KERN_WARNING "error: reading the clock returned: %s\n", 
@@ -385,7 +385,7 @@ static int ppc_rtas_sensors_show(struct seq_file *m, void *v)
 {
 	int i,j;
 	int state, error;
-	int get_sensor_state = rtas_token("get-sensor-state");
+	int get_sensor_state = rtas_function_token(RTAS_FN_GET_SENSOR_STATE);
 
 	seq_printf(m, "RTAS (RunTime Abstraction Services) Sensor Information\n");
 	seq_printf(m, "Sensor\t\tValue\t\tCondition\tLocation\n");
@@ -708,8 +708,8 @@ static ssize_t ppc_rtas_tone_freq_write(struct file *file,
 		return error;
 
 	rtas_tone_frequency = freq; /* save it for later */
-	error = rtas_call(rtas_token("set-indicator"), 3, 1, NULL,
-			TONE_FREQUENCY, 0, freq);
+	error = rtas_call(rtas_function_token(RTAS_FN_SET_INDICATOR), 3, 1, NULL,
+			  TONE_FREQUENCY, 0, freq);
 	if (error)
 		printk(KERN_WARNING "error: setting tone frequency returned: %s\n", 
 				ppc_rtas_process_error(error));
@@ -736,8 +736,8 @@ static ssize_t ppc_rtas_tone_volume_write(struct file *file,
 		volume = 100;
 	
         rtas_tone_volume = volume; /* save it for later */
-	error = rtas_call(rtas_token("set-indicator"), 3, 1, NULL,
-			TONE_VOLUME, 0, volume);
+	error = rtas_call(rtas_function_token(RTAS_FN_SET_INDICATOR), 3, 1, NULL,
+			  TONE_VOLUME, 0, volume);
 	if (error)
 		printk(KERN_WARNING "error: setting tone volume returned: %s\n", 
 				ppc_rtas_process_error(error));
diff --git a/arch/powerpc/kernel/rtas-rtc.c b/arch/powerpc/kernel/rtas-rtc.c
index 5a31d1829bca..6996214532bd 100644
--- a/arch/powerpc/kernel/rtas-rtc.c
+++ b/arch/powerpc/kernel/rtas-rtc.c
@@ -21,7 +21,7 @@ time64_t __init rtas_get_boot_time(void)
 
 	max_wait_tb = get_tb() + tb_ticks_per_usec * 1000 * MAX_RTC_WAIT;
 	do {
-		error = rtas_call(rtas_token("get-time-of-day"), 0, 8, ret);
+		error = rtas_call(rtas_function_token(RTAS_FN_GET_TIME_OF_DAY), 0, 8, ret);
 
 		wait_time = rtas_busy_delay_time(error);
 		if (wait_time) {
@@ -53,7 +53,7 @@ void rtas_get_rtc_time(struct rtc_time *rtc_tm)
 
 	max_wait_tb = get_tb() + tb_ticks_per_usec * 1000 * MAX_RTC_WAIT;
 	do {
-		error = rtas_call(rtas_token("get-time-of-day"), 0, 8, ret);
+		error = rtas_call(rtas_function_token(RTAS_FN_GET_TIME_OF_DAY), 0, 8, ret);
 
 		wait_time = rtas_busy_delay_time(error);
 		if (wait_time) {
@@ -90,7 +90,7 @@ int rtas_set_rtc_time(struct rtc_time *tm)
 
 	max_wait_tb = get_tb() + tb_ticks_per_usec * 1000 * MAX_RTC_WAIT;
 	do {
-	        error = rtas_call(rtas_token("set-time-of-day"), 7, 1, NULL,
+		error = rtas_call(rtas_function_token(RTAS_FN_SET_TIME_OF_DAY), 7, 1, NULL,
 				  tm->tm_year + 1900, tm->tm_mon + 1,
 				  tm->tm_mday, tm->tm_hour, tm->tm_min,
 				  tm->tm_sec, 0);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 17e59306ce63..833f262a2165 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -776,8 +776,8 @@ void rtas_progress(char *s, unsigned short hex)
 					"ibm,display-truncation-length", NULL);
 			of_node_put(root);
 		}
-		display_character = rtas_token("display-character");
-		set_indicator = rtas_token("set-indicator");
+		display_character = rtas_function_token(RTAS_FN_DISPLAY_CHARACTER);
+		set_indicator = rtas_function_token(RTAS_FN_SET_INDICATOR);
 	}
 
 	if (display_character == RTAS_UNKNOWN_SERVICE) {
@@ -931,7 +931,6 @@ static void __init init_error_log_max(void)
 
 
 static char rtas_err_buf[RTAS_ERROR_LOG_MAX];
-static int rtas_last_error_token;
 
 /** Return a copy of the detailed error text associated with the
  *  most recent failed call to rtas.  Because the error text
@@ -941,16 +940,17 @@ static int rtas_last_error_token;
  */
 static char *__fetch_rtas_last_error(char *altbuf)
 {
+	const s32 token = rtas_function_token(RTAS_FN_RTAS_LAST_ERROR);
 	struct rtas_args err_args, save_args;
 	u32 bufsz;
 	char *buf = NULL;
 
-	if (rtas_last_error_token == -1)
+	if (token == -1)
 		return NULL;
 
 	bufsz = rtas_get_error_log_max();
 
-	err_args.token = cpu_to_be32(rtas_last_error_token);
+	err_args.token = cpu_to_be32(token);
 	err_args.nargs = cpu_to_be32(2);
 	err_args.nret = cpu_to_be32(1);
 	err_args.args[0] = cpu_to_be32(__pa(rtas_err_buf));
@@ -1019,8 +1019,11 @@ void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 	va_end(list);
 }
 
-static int ibm_open_errinjct_token;
-static int ibm_errinjct_token;
+static bool token_is_restricted_errinjct(s32 token)
+{
+	return token == rtas_function_token(RTAS_FN_IBM_OPEN_ERRINJCT) ||
+	       token == rtas_function_token(RTAS_FN_IBM_ERRINJCT);
+}
 
 /**
  * rtas_call() - Invoke an RTAS firmware function.
@@ -1092,7 +1095,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
 		return -1;
 
-	if (token == ibm_open_errinjct_token || token == ibm_errinjct_token) {
+	if (token_is_restricted_errinjct(token)) {
 		/*
 		 * It would be nicer to not discard the error value
 		 * from security_locked_down(), but callers expect an
@@ -1323,7 +1326,7 @@ static int rtas_error_rc(int rtas_rc)
 
 int rtas_get_power_level(int powerdomain, int *level)
 {
-	int token = rtas_token("get-power-level");
+	int token = rtas_function_token(RTAS_FN_GET_POWER_LEVEL);
 	int rc;
 
 	if (token == RTAS_UNKNOWN_SERVICE)
@@ -1340,7 +1343,7 @@ EXPORT_SYMBOL_GPL(rtas_get_power_level);
 
 int rtas_set_power_level(int powerdomain, int level, int *setlevel)
 {
-	int token = rtas_token("set-power-level");
+	int token = rtas_function_token(RTAS_FN_SET_POWER_LEVEL);
 	int rc;
 
 	if (token == RTAS_UNKNOWN_SERVICE)
@@ -1358,7 +1361,7 @@ EXPORT_SYMBOL_GPL(rtas_set_power_level);
 
 int rtas_get_sensor(int sensor, int index, int *state)
 {
-	int token = rtas_token("get-sensor-state");
+	int token = rtas_function_token(RTAS_FN_GET_SENSOR_STATE);
 	int rc;
 
 	if (token == RTAS_UNKNOWN_SERVICE)
@@ -1376,7 +1379,7 @@ EXPORT_SYMBOL_GPL(rtas_get_sensor);
 
 int rtas_get_sensor_fast(int sensor, int index, int *state)
 {
-	int token = rtas_token("get-sensor-state");
+	int token = rtas_function_token(RTAS_FN_GET_SENSOR_STATE);
 	int rc;
 
 	if (token == RTAS_UNKNOWN_SERVICE)
@@ -1418,7 +1421,7 @@ bool rtas_indicator_present(int token, int *maxindex)
 
 int rtas_set_indicator(int indicator, int index, int new_value)
 {
-	int token = rtas_token("set-indicator");
+	int token = rtas_function_token(RTAS_FN_SET_INDICATOR);
 	int rc;
 
 	if (token == RTAS_UNKNOWN_SERVICE)
@@ -1439,8 +1442,8 @@ EXPORT_SYMBOL_GPL(rtas_set_indicator);
  */
 int rtas_set_indicator_fast(int indicator, int index, int new_value)
 {
+	int token = rtas_function_token(RTAS_FN_SET_INDICATOR);
 	int rc;
-	int token = rtas_token("set-indicator");
 
 	if (token == RTAS_UNKNOWN_SERVICE)
 		return -ENOENT;
@@ -1482,10 +1485,11 @@ int rtas_set_indicator_fast(int indicator, int index, int new_value)
  */
 int rtas_ibm_suspend_me(int *fw_status)
 {
+	int token = rtas_function_token(RTAS_FN_IBM_SUSPEND_ME);
 	int fwrc;
 	int ret;
 
-	fwrc = rtas_call(rtas_token("ibm,suspend-me"), 0, 1, NULL);
+	fwrc = rtas_call(token, 0, 1, NULL);
 
 	switch (fwrc) {
 	case 0:
@@ -1518,7 +1522,7 @@ void __noreturn rtas_restart(char *cmd)
 	if (rtas_flash_term_hook)
 		rtas_flash_term_hook(SYS_RESTART);
 	pr_emerg("system-reboot returned %d\n",
-		 rtas_call(rtas_token("system-reboot"), 0, 1, NULL));
+		 rtas_call(rtas_function_token(RTAS_FN_SYSTEM_REBOOT), 0, 1, NULL));
 	for (;;);
 }
 
@@ -1528,7 +1532,7 @@ void rtas_power_off(void)
 		rtas_flash_term_hook(SYS_POWER_OFF);
 	/* allow power on only with power button press */
 	pr_emerg("power-off returned %d\n",
-		 rtas_call(rtas_token("power-off"), 2, 1, NULL, -1, -1));
+		 rtas_call(rtas_function_token(RTAS_FN_POWER_OFF), 2, 1, NULL, -1, -1));
 	for (;;);
 }
 
@@ -1538,16 +1542,17 @@ void __noreturn rtas_halt(void)
 		rtas_flash_term_hook(SYS_HALT);
 	/* allow power on only with power button press */
 	pr_emerg("power-off returned %d\n",
-		 rtas_call(rtas_token("power-off"), 2, 1, NULL, -1, -1));
+		 rtas_call(rtas_function_token(RTAS_FN_POWER_OFF), 2, 1, NULL, -1, -1));
 	for (;;);
 }
 
 /* Must be in the RMO region, so we place it here */
 static char rtas_os_term_buf[2048];
-static s32 ibm_os_term_token = RTAS_UNKNOWN_SERVICE;
+static bool ibm_extended_os_term;
 
 void rtas_os_term(char *str)
 {
+	s32 token = rtas_function_token(RTAS_FN_IBM_OS_TERM);
 	int status;
 
 	/*
@@ -1556,7 +1561,8 @@ void rtas_os_term(char *str)
 	 * this property may terminate the partition which we want to avoid
 	 * since it interferes with panic_timeout.
 	 */
-	if (ibm_os_term_token == RTAS_UNKNOWN_SERVICE)
+
+	if (token == RTAS_UNKNOWN_SERVICE || !ibm_extended_os_term)
 		return;
 
 	snprintf(rtas_os_term_buf, 2048, "OS panic: %s", str);
@@ -1567,8 +1573,7 @@ void rtas_os_term(char *str)
 	 * schedules.
 	 */
 	do {
-		status = rtas_call(ibm_os_term_token, 1, 1, NULL,
-				   __pa(rtas_os_term_buf));
+		status = rtas_call(token, 1, 1, NULL, __pa(rtas_os_term_buf));
 	} while (rtas_busy_delay_time(status));
 
 	if (status != 0)
@@ -1588,10 +1593,9 @@ void rtas_os_term(char *str)
  */
 void rtas_activate_firmware(void)
 {
-	int token;
+	int token = rtas_function_token(RTAS_FN_IBM_ACTIVATE_FIRMWARE);
 	int fwrc;
 
-	token = rtas_token("ibm,activate-firmware");
 	if (token == RTAS_UNKNOWN_SERVICE) {
 		pr_notice("ibm,activate-firmware method unavailable\n");
 		return;
@@ -1677,6 +1681,8 @@ static bool block_rtas_call(int token, int nargs,
 {
 	const struct rtas_function *func;
 	const struct rtas_filter *f;
+	const bool is_platform_dump = token == rtas_function_token(RTAS_FN_IBM_PLATFORM_DUMP);
+	const bool is_config_conn = token == rtas_function_token(RTAS_FN_IBM_CONFIGURE_CONNECTOR);
 	u32 base, size, end;
 
 	/*
@@ -1713,8 +1719,7 @@ static bool block_rtas_call(int token, int nargs,
 		 * Special case for ibm,platform-dump - NULL buffer
 		 * address is used to indicate end of dump processing
 		 */
-		if (!strcmp(func->name, "ibm,platform-dump") &&
-		    base == 0)
+		if (is_platform_dump && base == 0)
 			return false;
 
 		if (!in_rmo_buf(base, end))
@@ -1735,8 +1740,7 @@ static bool block_rtas_call(int token, int nargs,
 		 * Special case for ibm,configure-connector where the
 		 * address can be 0
 		 */
-		if (!strcmp(func->name, "ibm,configure-connector") &&
-		    base == 0)
+		if (is_config_conn && base == 0)
 			return false;
 
 		if (!in_rmo_buf(base, end))
@@ -1791,7 +1795,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	if (block_rtas_call(token, nargs, &args))
 		return -EINVAL;
 
-	if (token == ibm_open_errinjct_token || token == ibm_errinjct_token) {
+	if (token_is_restricted_errinjct(token)) {
 		int err;
 
 		err = security_locked_down(LOCKDOWN_RTAS_ERROR_INJECTION);
@@ -1800,7 +1804,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	}
 
 	/* Need to handle ibm,suspend_me call specially */
-	if (token == rtas_token("ibm,suspend-me")) {
+	if (token == rtas_function_token(RTAS_FN_IBM_SUSPEND_ME)) {
 
 		/*
 		 * rtas_ibm_suspend_me assumes the streamid handle is in cpu
@@ -1935,11 +1939,10 @@ void __init rtas_initialize(void)
 	rtas_function_table_init();
 
 	/*
-	 * Discover these now to avoid device tree lookups in the
+	 * Discover this now to avoid a device tree lookup in the
 	 * panic path.
 	 */
-	if (of_property_read_bool(rtas.dev, "ibm,extended-os-term"))
-		ibm_os_term_token = rtas_token("ibm,os-term");
+	ibm_extended_os_term = of_property_read_bool(rtas.dev, "ibm,extended-os-term");
 
 	/* If RTAS was found, allocate the RMO buffer for it and look for
 	 * the stop-self token if any
@@ -1954,12 +1957,6 @@ void __init rtas_initialize(void)
 		panic("ERROR: RTAS: Failed to allocate %lx bytes below %pa\n",
 		      PAGE_SIZE, &rtas_region);
 
-#ifdef CONFIG_RTAS_ERROR_LOGGING
-	rtas_last_error_token = rtas_token("rtas-last-error");
-#endif
-	ibm_open_errinjct_token = rtas_token("ibm,open-errinjct");
-	ibm_errinjct_token = rtas_token("ibm,errinjct");
-
 	rtas_work_area_reserve_arena(rtas_region);
 }
 
@@ -2015,13 +2012,13 @@ void rtas_give_timebase(void)
 
 	raw_spin_lock_irqsave(&timebase_lock, flags);
 	hard_irq_disable();
-	rtas_call(rtas_token("freeze-time-base"), 0, 1, NULL);
+	rtas_call(rtas_function_token(RTAS_FN_FREEZE_TIME_BASE), 0, 1, NULL);
 	timebase = get_tb();
 	raw_spin_unlock(&timebase_lock);
 
 	while (timebase)
 		barrier();
-	rtas_call(rtas_token("thaw-time-base"), 0, 1, NULL);
+	rtas_call(rtas_function_token(RTAS_FN_THAW_TIME_BASE), 0, 1, NULL);
 	local_irq_restore(flags);
 }
 
diff --git a/arch/powerpc/kernel/rtas_flash.c b/arch/powerpc/kernel/rtas_flash.c
index bc817a5619d6..4caf5e3079eb 100644
--- a/arch/powerpc/kernel/rtas_flash.c
+++ b/arch/powerpc/kernel/rtas_flash.c
@@ -376,7 +376,7 @@ static void manage_flash(struct rtas_manage_flash_t *args_buf, unsigned int op)
 	s32 rc;
 
 	do {
-		rc = rtas_call(rtas_token("ibm,manage-flash-image"), 1, 1,
+		rc = rtas_call(rtas_function_token(RTAS_FN_IBM_MANAGE_FLASH_IMAGE), 1, 1,
 			       NULL, op);
 	} while (rtas_busy_delay(rc));
 
@@ -444,7 +444,7 @@ static ssize_t manage_flash_write(struct file *file, const char __user *buf,
  */
 static void validate_flash(struct rtas_validate_flash_t *args_buf)
 {
-	int token = rtas_token("ibm,validate-flash-image");
+	int token = rtas_function_token(RTAS_FN_IBM_VALIDATE_FLASH_IMAGE);
 	int update_results;
 	s32 rc;	
 
@@ -570,7 +570,7 @@ static void rtas_flash_firmware(int reboot_type)
 		return;
 	}
 
-	update_token = rtas_token("ibm,update-flash-64-and-reboot");
+	update_token = rtas_function_token(RTAS_FN_IBM_UPDATE_FLASH_64_AND_REBOOT);
 	if (update_token == RTAS_UNKNOWN_SERVICE) {
 		printk(KERN_ALERT "FLASH: ibm,update-flash-64-and-reboot "
 		       "is not available -- not a service partition?\n");
@@ -653,7 +653,7 @@ static void rtas_flash_firmware(int reboot_type)
  */
 struct rtas_flash_file {
 	const char *filename;
-	const char *rtas_call_name;
+	const rtas_fn_handle_t handle;
 	int *status;
 	const struct proc_ops ops;
 };
@@ -661,7 +661,7 @@ struct rtas_flash_file {
 static const struct rtas_flash_file rtas_flash_files[] = {
 	{
 		.filename	= "powerpc/rtas/" FIRMWARE_FLASH_NAME,
-		.rtas_call_name	= "ibm,update-flash-64-and-reboot",
+		.handle		= RTAS_FN_IBM_UPDATE_FLASH_64_AND_REBOOT,
 		.status		= &rtas_update_flash_data.status,
 		.ops.proc_read	= rtas_flash_read_msg,
 		.ops.proc_write	= rtas_flash_write,
@@ -670,7 +670,7 @@ static const struct rtas_flash_file rtas_flash_files[] = {
 	},
 	{
 		.filename	= "powerpc/rtas/" FIRMWARE_UPDATE_NAME,
-		.rtas_call_name	= "ibm,update-flash-64-and-reboot",
+		.handle		= RTAS_FN_IBM_UPDATE_FLASH_64_AND_REBOOT,
 		.status		= &rtas_update_flash_data.status,
 		.ops.proc_read	= rtas_flash_read_num,
 		.ops.proc_write	= rtas_flash_write,
@@ -679,7 +679,7 @@ static const struct rtas_flash_file rtas_flash_files[] = {
 	},
 	{
 		.filename	= "powerpc/rtas/" VALIDATE_FLASH_NAME,
-		.rtas_call_name	= "ibm,validate-flash-image",
+		.handle		= RTAS_FN_IBM_VALIDATE_FLASH_IMAGE,
 		.status		= &rtas_validate_flash_data.status,
 		.ops.proc_read	= validate_flash_read,
 		.ops.proc_write	= validate_flash_write,
@@ -688,7 +688,7 @@ static const struct rtas_flash_file rtas_flash_files[] = {
 	},
 	{
 		.filename	= "powerpc/rtas/" MANAGE_FLASH_NAME,
-		.rtas_call_name	= "ibm,manage-flash-image",
+		.handle		= RTAS_FN_IBM_MANAGE_FLASH_IMAGE,
 		.status		= &rtas_manage_flash_data.status,
 		.ops.proc_read	= manage_flash_read,
 		.ops.proc_write	= manage_flash_write,
@@ -700,8 +700,7 @@ static int __init rtas_flash_init(void)
 {
 	int i;
 
-	if (rtas_token("ibm,update-flash-64-and-reboot") ==
-		       RTAS_UNKNOWN_SERVICE) {
+	if (rtas_function_token(RTAS_FN_IBM_UPDATE_FLASH_64_AND_REBOOT) == RTAS_UNKNOWN_SERVICE) {
 		pr_info("rtas_flash: no firmware flash support\n");
 		return -EINVAL;
 	}
@@ -730,7 +729,7 @@ static int __init rtas_flash_init(void)
 		 * This code assumes that the status int is the first member of the
 		 * struct
 		 */
-		token = rtas_token(f->rtas_call_name);
+		token = rtas_function_token(f->handle);
 		if (token == RTAS_UNKNOWN_SERVICE)
 			*f->status = FLASH_AUTH;
 		else
diff --git a/arch/powerpc/kernel/rtas_pci.c b/arch/powerpc/kernel/rtas_pci.c
index 5a2f5ea3b054..e1fdc7473b72 100644
--- a/arch/powerpc/kernel/rtas_pci.c
+++ b/arch/powerpc/kernel/rtas_pci.c
@@ -191,10 +191,10 @@ static void python_countermeasures(struct device_node *dev)
 
 void __init init_pci_config_tokens(void)
 {
-	read_pci_config = rtas_token("read-pci-config");
-	write_pci_config = rtas_token("write-pci-config");
-	ibm_read_pci_config = rtas_token("ibm,read-pci-config");
-	ibm_write_pci_config = rtas_token("ibm,write-pci-config");
+	read_pci_config = rtas_function_token(RTAS_FN_READ_PCI_CONFIG);
+	write_pci_config = rtas_function_token(RTAS_FN_WRITE_PCI_CONFIG);
+	ibm_read_pci_config = rtas_function_token(RTAS_FN_IBM_READ_PCI_CONFIG);
+	ibm_write_pci_config = rtas_function_token(RTAS_FN_IBM_WRITE_PCI_CONFIG);
 }
 
 unsigned long get_phb_buid(struct device_node *phb)
diff --git a/arch/powerpc/kernel/rtasd.c b/arch/powerpc/kernel/rtasd.c
index cc56ac6ba4b0..9bba469239fc 100644
--- a/arch/powerpc/kernel/rtasd.c
+++ b/arch/powerpc/kernel/rtasd.c
@@ -506,7 +506,7 @@ static int __init rtas_event_scan_init(void)
 		return 0;
 
 	/* No RTAS */
-	event_scan = rtas_token("event-scan");
+	event_scan = rtas_function_token(RTAS_FN_EVENT_SCAN);
 	if (event_scan == RTAS_UNKNOWN_SERVICE) {
 		printk(KERN_INFO "rtasd: No event-scan on system\n");
 		return -ENODEV;
diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
index e0647720ed5e..61dfec74ff85 100644
--- a/arch/powerpc/platforms/52xx/efika.c
+++ b/arch/powerpc/platforms/52xx/efika.c
@@ -41,7 +41,7 @@ static int rtas_read_config(struct pci_bus *bus, unsigned int devfn, int offset,
 	int ret = -1;
 	int rval;
 
-	rval = rtas_call(rtas_token("read-pci-config"), 2, 2, &ret, addr, len);
+	rval = rtas_call(rtas_function_token(RTAS_FN_READ_PCI_CONFIG), 2, 2, &ret, addr, len);
 	*val = ret;
 	return rval ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
 }
@@ -55,7 +55,7 @@ static int rtas_write_config(struct pci_bus *bus, unsigned int devfn,
 	    | (hose->global_number << 24);
 	int rval;
 
-	rval = rtas_call(rtas_token("write-pci-config"), 3, 1, NULL,
+	rval = rtas_call(rtas_function_token(RTAS_FN_WRITE_PCI_CONFIG), 3, 1, NULL,
 			 addr, len, val);
 	return rval ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
 }
diff --git a/arch/powerpc/platforms/cell/ras.c b/arch/powerpc/platforms/cell/ras.c
index 8d934ea6270c..98db63b72d56 100644
--- a/arch/powerpc/platforms/cell/ras.c
+++ b/arch/powerpc/platforms/cell/ras.c
@@ -297,8 +297,8 @@ int cbe_sysreset_hack(void)
 static int __init cbe_ptcal_init(void)
 {
 	int ret;
-	ptcal_start_tok = rtas_token("ibm,cbe-start-ptcal");
-	ptcal_stop_tok = rtas_token("ibm,cbe-stop-ptcal");
+	ptcal_start_tok = rtas_function_token(RTAS_FN_IBM_CBE_START_PTCAL);
+	ptcal_stop_tok = rtas_function_token(RTAS_FN_IBM_CBE_STOP_PTCAL);
 
 	if (ptcal_start_tok == RTAS_UNKNOWN_SERVICE
 			|| ptcal_stop_tok == RTAS_UNKNOWN_SERVICE)
diff --git a/arch/powerpc/platforms/cell/smp.c b/arch/powerpc/platforms/cell/smp.c
index 31ce00b52a32..30394c6f8894 100644
--- a/arch/powerpc/platforms/cell/smp.c
+++ b/arch/powerpc/platforms/cell/smp.c
@@ -81,7 +81,7 @@ static inline int smp_startup_cpu(unsigned int lcpu)
 	 * If the RTAS start-cpu token does not exist then presume the
 	 * cpu is already spinning.
 	 */
-	start_cpu = rtas_token("start-cpu");
+	start_cpu = rtas_function_token(RTAS_FN_START_CPU);
 	if (start_cpu == RTAS_UNKNOWN_SERVICE)
 		return 1;
 
@@ -152,7 +152,7 @@ void __init smp_init_cell(void)
 	cpumask_clear_cpu(boot_cpuid, &of_spin_map);
 
 	/* Non-lpar has additional take/give timebase */
-	if (rtas_token("freeze-time-base") != RTAS_UNKNOWN_SERVICE) {
+	if (rtas_function_token(RTAS_FN_FREEZE_TIME_BASE) != RTAS_UNKNOWN_SERVICE) {
 		smp_ops->give_timebase = rtas_give_timebase;
 		smp_ops->take_timebase = rtas_take_timebase;
 	}
diff --git a/arch/powerpc/platforms/chrp/nvram.c b/arch/powerpc/platforms/chrp/nvram.c
index dab78076fedb..0eedae96498c 100644
--- a/arch/powerpc/platforms/chrp/nvram.c
+++ b/arch/powerpc/platforms/chrp/nvram.c
@@ -31,7 +31,7 @@ static unsigned char chrp_nvram_read_val(int addr)
 		return 0xff;
 	}
 	spin_lock_irqsave(&nvram_lock, flags);
-	if ((rtas_call(rtas_token("nvram-fetch"), 3, 2, &done, addr,
+	if ((rtas_call(rtas_function_token(RTAS_FN_NVRAM_FETCH), 3, 2, &done, addr,
 		       __pa(nvram_buf), 1) != 0) || 1 != done)
 		ret = 0xff;
 	else
@@ -53,7 +53,7 @@ static void chrp_nvram_write_val(int addr, unsigned char val)
 	}
 	spin_lock_irqsave(&nvram_lock, flags);
 	nvram_buf[0] = val;
-	if ((rtas_call(rtas_token("nvram-store"), 3, 2, &done, addr,
+	if ((rtas_call(rtas_function_token(RTAS_FN_NVRAM_STORE), 3, 2, &done, addr,
 		       __pa(nvram_buf), 1) != 0) || 1 != done)
 		printk(KERN_DEBUG "rtas IO error storing 0x%02x at %d", val, addr);
 	spin_unlock_irqrestore(&nvram_lock, flags);
diff --git a/arch/powerpc/platforms/chrp/pci.c b/arch/powerpc/platforms/chrp/pci.c
index 6f6598e771ff..428fd2a7b3ee 100644
--- a/arch/powerpc/platforms/chrp/pci.c
+++ b/arch/powerpc/platforms/chrp/pci.c
@@ -104,7 +104,7 @@ static int rtas_read_config(struct pci_bus *bus, unsigned int devfn, int offset,
         int ret = -1;
 	int rval;
 
-	rval = rtas_call(rtas_token("read-pci-config"), 2, 2, &ret, addr, len);
+	rval = rtas_call(rtas_function_token(RTAS_FN_READ_PCI_CONFIG), 2, 2, &ret, addr, len);
 	*val = ret;
 	return rval? PCIBIOS_DEVICE_NOT_FOUND: PCIBIOS_SUCCESSFUL;
 }
@@ -118,7 +118,7 @@ static int rtas_write_config(struct pci_bus *bus, unsigned int devfn, int offset
 		| (hose->global_number << 24);
 	int rval;
 
-	rval = rtas_call(rtas_token("write-pci-config"), 3, 1, NULL,
+	rval = rtas_call(rtas_function_token(RTAS_FN_WRITE_PCI_CONFIG), 3, 1, NULL,
 			 addr, len, val);
 	return rval? PCIBIOS_DEVICE_NOT_FOUND: PCIBIOS_SUCCESSFUL;
 }
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index ec63c0558db6..d9049ceb1046 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -323,11 +323,11 @@ static void __init chrp_setup_arch(void)
 	printk("chrp type = %x [%s]\n", _chrp_type, chrp_names[_chrp_type]);
 
 	rtas_initialize();
-	if (rtas_token("display-character") >= 0)
+	if (rtas_function_token(RTAS_FN_DISPLAY_CHARACTER) >= 0)
 		ppc_md.progress = rtas_progress;
 
 	/* use RTAS time-of-day routines if available */
-	if (rtas_token("get-time-of-day") != RTAS_UNKNOWN_SERVICE) {
+	if (rtas_function_token(RTAS_FN_GET_TIME_OF_DAY) != RTAS_UNKNOWN_SERVICE) {
 		ppc_md.get_boot_time	= rtas_get_boot_time;
 		ppc_md.get_rtc_time	= rtas_get_rtc_time;
 		ppc_md.set_rtc_time	= rtas_set_rtc_time;
diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index c26c379e1cc8..98c8e3603064 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -162,8 +162,8 @@ static struct smp_ops_t maple_smp_ops = {
 
 static void __init maple_use_rtas_reboot_and_halt_if_present(void)
 {
-	if (rtas_service_present("system-reboot") &&
-	    rtas_service_present("power-off")) {
+	if (rtas_function_implemented(RTAS_FN_SYSTEM_REBOOT) &&
+	    rtas_function_implemented(RTAS_FN_POWER_OFF)) {
 		ppc_md.restart = rtas_restart;
 		pm_power_off = rtas_power_off;
 		ppc_md.halt = rtas_halt;
diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 9b65b50a5456..75ffdbcd2865 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -143,7 +143,7 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
 	int cc_token;
 	int rc = -1;
 
-	cc_token = rtas_token("ibm,configure-connector");
+	cc_token = rtas_function_token(RTAS_FN_IBM_CONFIGURE_CONNECTOR);
 	if (cc_token == RTAS_UNKNOWN_SERVICE)
 		return NULL;
 
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 6b507b62ce8f..def184da51cf 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -699,7 +699,7 @@ static int pseries_eeh_write_config(struct eeh_dev *edev, int where, int size, u
 static int pseries_send_allow_unfreeze(struct pci_dn *pdn, u16 *vf_pe_array, int cur_vfs)
 {
 	int rc;
-	int ibm_allow_unfreeze = rtas_token("ibm,open-sriov-allow-unfreeze");
+	int ibm_allow_unfreeze = rtas_function_token(RTAS_FN_IBM_OPEN_SRIOV_ALLOW_UNFREEZE);
 	unsigned long buid, addr;
 
 	addr = rtas_config_addr(pdn->busno, pdn->devfn, 0);
@@ -774,7 +774,7 @@ static int pseries_notify_resume(struct eeh_dev *edev)
 	if (!edev)
 		return -EEXIST;
 
-	if (rtas_token("ibm,open-sriov-allow-unfreeze") == RTAS_UNKNOWN_SERVICE)
+	if (rtas_function_token(RTAS_FN_IBM_OPEN_SRIOV_ALLOW_UNFREEZE) == RTAS_UNKNOWN_SERVICE)
 		return -EINVAL;
 
 	if (edev->pdev->is_physfn || edev->pdev->is_virtfn)
@@ -815,14 +815,14 @@ static int __init eeh_pseries_init(void)
 	int ret, config_addr;
 
 	/* figure out EEH RTAS function call tokens */
-	ibm_set_eeh_option		= rtas_token("ibm,set-eeh-option");
-	ibm_set_slot_reset		= rtas_token("ibm,set-slot-reset");
-	ibm_read_slot_reset_state2	= rtas_token("ibm,read-slot-reset-state2");
-	ibm_read_slot_reset_state	= rtas_token("ibm,read-slot-reset-state");
-	ibm_slot_error_detail		= rtas_token("ibm,slot-error-detail");
-	ibm_get_config_addr_info2	= rtas_token("ibm,get-config-addr-info2");
-	ibm_get_config_addr_info	= rtas_token("ibm,get-config-addr-info");
-	ibm_configure_pe		= rtas_token("ibm,configure-pe");
+	ibm_set_eeh_option		= rtas_function_token(RTAS_FN_IBM_SET_EEH_OPTION);
+	ibm_set_slot_reset		= rtas_function_token(RTAS_FN_IBM_SET_SLOT_RESET);
+	ibm_read_slot_reset_state2	= rtas_function_token(RTAS_FN_IBM_READ_SLOT_RESET_STATE2);
+	ibm_read_slot_reset_state	= rtas_function_token(RTAS_FN_IBM_READ_SLOT_RESET_STATE);
+	ibm_slot_error_detail		= rtas_function_token(RTAS_FN_IBM_SLOT_ERROR_DETAIL);
+	ibm_get_config_addr_info2	= rtas_function_token(RTAS_FN_IBM_GET_CONFIG_ADDR_INFO2);
+	ibm_get_config_addr_info	= rtas_function_token(RTAS_FN_IBM_GET_CONFIG_ADDR_INFO);
+	ibm_configure_pe		= rtas_function_token(RTAS_FN_IBM_CONFIGURE_PE);
 
 	/*
 	 * ibm,configure-pe and ibm,configure-bridge have the same semantics,
@@ -830,7 +830,7 @@ static int __init eeh_pseries_init(void)
 	 * ibm,configure-pe then fall back to using ibm,configure-bridge.
 	 */
 	if (ibm_configure_pe == RTAS_UNKNOWN_SERVICE)
-		ibm_configure_pe	= rtas_token("ibm,configure-bridge");
+		ibm_configure_pe	= rtas_function_token(RTAS_FN_IBM_CONFIGURE_BRIDGE);
 
 	/*
 	 * Necessary sanity check. We needn't check "get-config-addr-info"
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 090ae5a1e0f5..982e5e4b5e06 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -855,8 +855,8 @@ static int __init pseries_cpu_hotplug_init(void)
 	ppc_md.cpu_release = dlpar_cpu_release;
 #endif /* CONFIG_ARCH_CPU_PROBE_RELEASE */
 
-	rtas_stop_self_token = rtas_token("stop-self");
-	qcss_tok = rtas_token("query-cpu-stopped-state");
+	rtas_stop_self_token = rtas_function_token(RTAS_FN_STOP_SELF);
+	qcss_tok = rtas_function_token(RTAS_FN_QUERY_CPU_STOPPED_STATE);
 
 	if (rtas_stop_self_token == RTAS_UNKNOWN_SERVICE ||
 			qcss_tok == RTAS_UNKNOWN_SERVICE) {
diff --git a/arch/powerpc/platforms/pseries/io_event_irq.c b/arch/powerpc/platforms/pseries/io_event_irq.c
index 7b74d4d34e9a..f411d4fe7b24 100644
--- a/arch/powerpc/platforms/pseries/io_event_irq.c
+++ b/arch/powerpc/platforms/pseries/io_event_irq.c
@@ -143,7 +143,7 @@ static int __init ioei_init(void)
 {
 	struct device_node *np;
 
-	ioei_check_exception_token = rtas_token("check-exception");
+	ioei_check_exception_token = rtas_function_token(RTAS_FN_CHECK_EXCEPTION);
 	if (ioei_check_exception_token == RTAS_UNKNOWN_SERVICE)
 		return -ENODEV;
 
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 4cea71aa0f41..643d309d1bd0 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -195,7 +195,7 @@ static int update_dt_node(struct device_node *dn, s32 scope)
 	u32 nprops;
 	u32 vd;
 
-	update_properties_token = rtas_token("ibm,update-properties");
+	update_properties_token = rtas_function_token(RTAS_FN_IBM_UPDATE_PROPERTIES);
 	if (update_properties_token == RTAS_UNKNOWN_SERVICE)
 		return -EINVAL;
 
@@ -306,7 +306,7 @@ static int pseries_devicetree_update(s32 scope)
 	int update_nodes_token;
 	int rc;
 
-	update_nodes_token = rtas_token("ibm,update-nodes");
+	update_nodes_token = rtas_function_token(RTAS_FN_IBM_UPDATE_NODES);
 	if (update_nodes_token == RTAS_UNKNOWN_SERVICE)
 		return 0;
 
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index 3f05507e444d..423ee1d5bd94 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -679,8 +679,8 @@ static void rtas_msi_pci_irq_fixup(struct pci_dev *pdev)
 
 static int rtas_msi_init(void)
 {
-	query_token  = rtas_token("ibm,query-interrupt-source-number");
-	change_token = rtas_token("ibm,change-msi");
+	query_token  = rtas_function_token(RTAS_FN_IBM_QUERY_INTERRUPT_SOURCE_NUMBER);
+	change_token = rtas_function_token(RTAS_FN_IBM_CHANGE_MSI);
 
 	if ((query_token == RTAS_UNKNOWN_SERVICE) ||
 			(change_token == RTAS_UNKNOWN_SERVICE)) {
diff --git a/arch/powerpc/platforms/pseries/nvram.c b/arch/powerpc/platforms/pseries/nvram.c
index cbf1720eb4aa..8130c37962c0 100644
--- a/arch/powerpc/platforms/pseries/nvram.c
+++ b/arch/powerpc/platforms/pseries/nvram.c
@@ -227,8 +227,8 @@ int __init pSeries_nvram_init(void)
 
 	nvram_size = be32_to_cpup(nbytes_p);
 
-	nvram_fetch = rtas_token("nvram-fetch");
-	nvram_store = rtas_token("nvram-store");
+	nvram_fetch = rtas_function_token(RTAS_FN_NVRAM_FETCH);
+	nvram_store = rtas_function_token(RTAS_FN_NVRAM_STORE);
 	printk(KERN_INFO "PPC64 nvram contains %d bytes\n", nvram_size);
 	of_node_put(nvram);
 
diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
index 6e671c3809ec..60e0a58928ef 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -60,7 +60,7 @@ static int pseries_send_map_pe(struct pci_dev *pdev, u16 num_vfs,
 	struct pci_dn *pdn;
 	int rc;
 	unsigned long buid, addr;
-	int ibm_map_pes = rtas_token("ibm,open-sriov-map-pe-number");
+	int ibm_map_pes = rtas_function_token(RTAS_FN_IBM_OPEN_SRIOV_MAP_PE_NUMBER);
 
 	if (ibm_map_pes == RTAS_UNKNOWN_SERVICE)
 		return -EINVAL;
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index f12516c3998c..adafd593d9d3 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -155,7 +155,7 @@ static int __init init_ras_IRQ(void)
 {
 	struct device_node *np;
 
-	ras_check_exception_token = rtas_token("check-exception");
+	ras_check_exception_token = rtas_function_token(RTAS_FN_CHECK_EXCEPTION);
 
 	/* Internal Errors */
 	np = of_find_node_by_path("/event-sources/internal-errors");
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 420a2fa48292..4a0cec8cf623 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -136,11 +136,11 @@ static void __init fwnmi_init(void)
 #endif
 	int ibm_nmi_register_token;
 
-	ibm_nmi_register_token = rtas_token("ibm,nmi-register");
+	ibm_nmi_register_token = rtas_function_token(RTAS_FN_IBM_NMI_REGISTER);
 	if (ibm_nmi_register_token == RTAS_UNKNOWN_SERVICE)
 		return;
 
-	ibm_nmi_interlock_token = rtas_token("ibm,nmi-interlock");
+	ibm_nmi_interlock_token = rtas_function_token(RTAS_FN_IBM_NMI_INTERLOCK);
 	if (WARN_ON(ibm_nmi_interlock_token == RTAS_UNKNOWN_SERVICE))
 		return;
 
@@ -1071,14 +1071,14 @@ static void __init pseries_init(void)
 static void pseries_power_off(void)
 {
 	int rc;
-	int rtas_poweroff_ups_token = rtas_token("ibm,power-off-ups");
+	int rtas_poweroff_ups_token = rtas_function_token(RTAS_FN_IBM_POWER_OFF_UPS);
 
 	if (rtas_flash_term_hook)
 		rtas_flash_term_hook(SYS_POWER_OFF);
 
 	if (rtas_poweron_auto == 0 ||
 		rtas_poweroff_ups_token == RTAS_UNKNOWN_SERVICE) {
-		rc = rtas_call(rtas_token("power-off"), 2, 1, NULL, -1, -1);
+		rc = rtas_call(rtas_function_token(RTAS_FN_POWER_OFF), 2, 1, NULL, -1, -1);
 		printk(KERN_INFO "RTAS power-off returned %d\n", rc);
 	} else {
 		rc = rtas_call(rtas_poweroff_ups_token, 0, 1, NULL);
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index 2bcfee86ff87..c597711ef20a 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -55,7 +55,7 @@ static cpumask_var_t of_spin_mask;
 int smp_query_cpu_stopped(unsigned int pcpu)
 {
 	int cpu_status, status;
-	int qcss_tok = rtas_token("query-cpu-stopped-state");
+	int qcss_tok = rtas_function_token(RTAS_FN_QUERY_CPU_STOPPED_STATE);
 
 	if (qcss_tok == RTAS_UNKNOWN_SERVICE) {
 		printk_once(KERN_INFO
@@ -108,7 +108,7 @@ static inline int smp_startup_cpu(unsigned int lcpu)
 	 * If the RTAS start-cpu token does not exist then presume the
 	 * cpu is already spinning.
 	 */
-	start_cpu = rtas_token("start-cpu");
+	start_cpu = rtas_function_token(RTAS_FN_START_CPU);
 	if (start_cpu == RTAS_UNKNOWN_SERVICE)
 		return 1;
 
@@ -266,7 +266,7 @@ void __init smp_init_pseries(void)
 	 * We know prom_init will not have started them if RTAS supports
 	 * query-cpu-stopped-state.
 	 */
-	if (rtas_token("query-cpu-stopped-state") == RTAS_UNKNOWN_SERVICE) {
+	if (rtas_function_token(RTAS_FN_QUERY_CPU_STOPPED_STATE) == RTAS_UNKNOWN_SERVICE) {
 		if (cpu_has_feature(CPU_FTR_SMT)) {
 			for_each_present_cpu(i) {
 				if (cpu_thread_in_core(i) == 0)
diff --git a/arch/powerpc/sysdev/xics/ics-rtas.c b/arch/powerpc/sysdev/xics/ics-rtas.c
index f8320f8e5bc7..b772a833d9b7 100644
--- a/arch/powerpc/sysdev/xics/ics-rtas.c
+++ b/arch/powerpc/sysdev/xics/ics-rtas.c
@@ -200,10 +200,10 @@ static struct ics ics_rtas = {
 
 __init int ics_rtas_init(void)
 {
-	ibm_get_xive = rtas_token("ibm,get-xive");
-	ibm_set_xive = rtas_token("ibm,set-xive");
-	ibm_int_on  = rtas_token("ibm,int-on");
-	ibm_int_off = rtas_token("ibm,int-off");
+	ibm_get_xive = rtas_function_token(RTAS_FN_IBM_GET_XIVE);
+	ibm_set_xive = rtas_function_token(RTAS_FN_IBM_SET_XIVE);
+	ibm_int_on  = rtas_function_token(RTAS_FN_IBM_INT_ON);
+	ibm_int_off = rtas_function_token(RTAS_FN_IBM_INT_OFF);
 
 	/* We enable the RTAS "ICS" if RTAS is present with the
 	 * appropriate tokens
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 0da66bc4823d..73c620c2a3a1 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -76,9 +76,6 @@ static cpumask_t xmon_batch_cpus = CPU_MASK_NONE;
 #define xmon_owner 0
 #endif /* CONFIG_SMP */
 
-#ifdef CONFIG_PPC_PSERIES
-static int set_indicator_token = RTAS_UNKNOWN_SERVICE;
-#endif
 static unsigned long in_xmon __read_mostly = 0;
 static int xmon_on = IS_ENABLED(CONFIG_XMON_DEFAULT);
 static bool xmon_is_ro = IS_ENABLED(CONFIG_XMON_DEFAULT_RO_MODE);
@@ -398,6 +395,7 @@ static inline void disable_surveillance(void)
 #ifdef CONFIG_PPC_PSERIES
 	/* Since this can't be a module, args should end up below 4GB. */
 	static struct rtas_args args;
+	const s32 token = rtas_function_token(RTAS_FN_SET_INDICATOR);
 
 	/*
 	 * At this point we have got all the cpus we can into
@@ -406,10 +404,10 @@ static inline void disable_surveillance(void)
 	 * If we did try to take rtas.lock there would be a
 	 * real possibility of deadlock.
 	 */
-	if (set_indicator_token == RTAS_UNKNOWN_SERVICE)
+	if (token == RTAS_UNKNOWN_SERVICE)
 		return;
 
-	rtas_call_unlocked(&args, set_indicator_token, 3, 1, NULL,
+	rtas_call_unlocked(&args, token, 3, 1, NULL,
 			   SURVEILLANCE_TOKEN, 0, 0);
 
 #endif /* CONFIG_PPC_PSERIES */
@@ -3976,14 +3974,6 @@ static void xmon_init(int enable)
 		__debugger_iabr_match = xmon_iabr_match;
 		__debugger_break_match = xmon_break_match;
 		__debugger_fault_handler = xmon_fault_handler;
-
-#ifdef CONFIG_PPC_PSERIES
-		/*
-		 * Get the token here to avoid trying to get a lock
-		 * during the crash, causing a deadlock.
-		 */
-		set_indicator_token = rtas_token("set-indicator");
-#endif
 	} else {
 		__debugger = NULL;
 		__debugger_ipi = NULL;

-- 
2.39.1

