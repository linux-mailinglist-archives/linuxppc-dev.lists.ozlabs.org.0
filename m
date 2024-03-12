Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91056879792
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 16:31:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=THFtL2OD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvHg92vk7z3vX8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 02:31:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=salutedevices.com header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail header.b=THFtL2OD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=salutedevices.com (client-ip=37.18.73.165; helo=mx1.sberdevices.ru; envelope-from=gnstark@salutedevices.com; receiver=lists.ozlabs.org)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvHfP4HYcz2xFt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 02:30:49 +1100 (AEDT)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5234410000B;
	Tue, 12 Mar 2024 18:30:43 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5234410000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710257443;
	bh=D30X9TVY00SV7Cw8ldbS2oJxymN6E02acOCqp5RlXEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=THFtL2ODmV4RIvMaps61366Xss5YdZGoXfR747GPLXiUrku/hBlK2vSH63/CMJ14v
	 /Id5c/2bxwEULEFXE8MUzXx0uBIF5HdjQSnHwfaFq8WCc42RoiGvej5t/DQdW0xgoX
	 COtNbW2gUMqLJPeWgYeCOPDFmKt4UNZ4efTDdqJVo0N/J8MC6gNCMYxXfzGJjLsvIt
	 8PcI/KIxROuZ+ZMC5+yRY4sy0PYIDlBZoynu6FE74gXUxfiUn/jlAWkKmw5vgxBK42
	 RuN2wgXnz+/Y/SmQiTBRMjkZF95smqEJ0PewgFCVREJBi+0+IuPyhcp11Dnlzk+6kw
	 B9fflsiaAKEfw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 12 Mar 2024 18:30:43 +0300 (MSK)
Received: from [172.28.66.90] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Mar 2024 18:30:42 +0300
Message-ID: <1f3395cb-ebab-44cd-b2b1-716e0130abad@salutedevices.com>
Date: Tue, 12 Mar 2024 18:30:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?UTF-8?Q?Marek_Beh=C3=BAn?= <marek.behun@nic.cz>, Waiman Long
	<longman@redhat.com>
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com>
 <20240307095639.b6utkbzr36liuu3p@kandell>
 <3d95ab40-2df5-4988-87be-568a628a0561@redhat.com>
 <20240307174414.4059d7ee@dellmb>
 <cfceef12-883e-4593-9dca-50768acb1aa9@salutedevices.com>
 <c3be9cb4-06cf-45c5-841f-3fa016e4d087@csgroup.eu>
 <9e13fd46-b05b-4fc2-abb6-c6c96dd576ee@salutedevices.com>
 <2106ea35-2d96-43f9-92a1-7d33ad5240b4@csgroup.eu>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <2106ea35-2d96-43f9-92a1-7d33ad5240b4@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/29 16:52:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/29 16:52:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
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
Cc: "kabel@kernel.org" <kabel@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "lee@kernel.org" <lee@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "mingo@redhat.com" <mingo@redhat.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>, "will@kernel.org" <will@kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Christophe

On 3/12/24 14:51, Christophe Leroy wrote:
> 
> 
> Le 12/03/2024 à 12:39, George Stark a écrit :
>> [Vous ne recevez pas souvent de courriers de gnstark@salutedevices.com.
>> Découvrez pourquoi ceci est important à
>> https://aka.ms/LearnAboutSenderIdentification ]

...

> You don't need that inline function, just change debug_devm_mutex_init()
> to __devm_mutex_init().

I stuck to debug_* name because mutex-debug.c already exports a set
of debug_ calls so...
Well it's not essential anyway. Here's the next try:

diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 67edc4ca2bee..537b5ea18ceb 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -22,6 +22,8 @@
  #include <linux/cleanup.h>
  #include <linux/mutex_types.h>

+struct device;
+
  #ifdef CONFIG_DEBUG_LOCK_ALLOC
  # define __DEP_MAP_MUTEX_INITIALIZER(lockname)			\
  		, .dep_map = {					\
@@ -117,6 +119,29 @@ do {							\
  } while (0)
  #endif /* CONFIG_PREEMPT_RT */

+#ifdef CONFIG_DEBUG_MUTEXES
+
+int __devm_mutex_init(struct device *dev, struct mutex *lock);
+
+#else
+
+static inline int __devm_mutex_init(struct device *dev, struct mutex *lock)
+{
+	/*
+	 * When CONFIG_DEBUG_MUTEXES is off mutex_destroy is just a nop so
+	 * no really need to register it in devm subsystem.
+	 */
+	return 0;
+}
+
+#endif
+
+#define devm_mutex_init(dev, mutex)			\
+({							\
+	mutex_init(mutex);				\
+	__devm_mutex_init(dev, mutex);			\
+})
+
  /*
   * See kernel/locking/mutex.c for detailed documentation of these APIs.
   * Also see Documentation/locking/mutex-design.rst.
diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-debug.c
index bc8abb8549d2..6aa77e3dc82e 100644
--- a/kernel/locking/mutex-debug.c
+++ b/kernel/locking/mutex-debug.c
@@ -19,6 +19,7 @@
  #include <linux/kallsyms.h>
  #include <linux/interrupt.h>
  #include <linux/debug_locks.h>
+#include <linux/device.h>

  #include "mutex.h"

@@ -89,6 +90,16 @@ void debug_mutex_init(struct mutex *lock, const char 
*name,
  	lock->magic = lock;
  }

+static void devm_mutex_release(void *res)
+{
+	mutex_destroy(res);
+}
+
+int __devm_mutex_init(struct device *dev, struct mutex *lock)
+{
+	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
+}
+
  /***
   * mutex_destroy - mark a mutex unusable
   * @lock: the mutex to be destroyed
-- 
2.25.1



>> +
>> +#else
>> +
>> +static inline int __devm_mutex_init(struct device *dev, struct mutex
>> *lock)
>> +{
>> +       /*
>> +       * When CONFIG_DEBUG_MUTEXES is off mutex_destroy is just a nop so
>> +       * no really need to register it in devm subsystem.
>> +       */
> 
> Don't know if it is because tabs are replaced by blanks in you email,
> but the stars should be aligned

Ack


-- 
Best regards
George
