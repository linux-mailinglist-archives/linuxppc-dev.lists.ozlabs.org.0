Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE38E495B77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 08:59:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgBcH4ZBcz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 18:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::620;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgBbk20bpz2xD7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 18:59:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UajgHXLsq8WcfVEZ4b+H+iUUgj11cKTen6mhxaPGwRNmnSKwN8F3xJL7d5u5+W8+RaS1mMSZ5UhMFMsgQiEIn68uYfuZBxDHqhUrv9jc414CN2bkzkDMOVSPEcVDDiq2FhJ5dPMr/1tZ8gfmcI721EfVEZQVZiYqeI0XA1giBndj3DQ7TXUTHxxE99506TcIDrIkblOTdxE3bNrJ+KTbtuXgdjjNgdEwefsnHwr1XU9kCdz2OPVxN3fd9WoUmDXd5XPULPEKOjI+xWgVsWayK0IUSWsLkAN5vCfjosIBd8FyCimU8DvkF5pJmbTDolsvOFV3LX5DyTKerbMYasl/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/P6ER9qrm7IlulOAP3MTQb++hKfeBkLKR8xz+65aJSE=;
 b=h7GH+cSZ9b1vVGMEFR+ls9Lxyhx6ips+/jItTMdAqurv1PFBOGpQ/1796uIDAjzyCcNySP5+aWP9kTxqANXAMbVGbawUqZ+b/fba8Cgce3p2m886c/BtwhdSm4T2pGH6uX+HgbNoc1479NvqPo1JkeE3V1pfD45hiDXGmnLbpQbTx1SIb8bZScM+yp+BPw6m9lEEsB1V0YFJwma9yRPOuzaDXYpsTIzbcgbZNPZhzo6Fd2v5slaHgDChh2KoOoGd/84UbbIYx+qA/NgQOykxVq4jvzuUeQjtxSRAfH1THUzPC08h8PNCW93okLkCUV5xNul/NPo98FLLoguPSKnFgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB4205.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 07:58:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 07:58:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Use the newly added is_tsk_32bit_task() macro
Thread-Topic: [PATCH] powerpc: Use the newly added is_tsk_32bit_task() macro
Thread-Index: AQHYDpy4hPHu76LjxU2w94A4PS0MOw==
Date: Fri, 21 Jan 2022 07:58:47 +0000
Message-ID: <7304a889dbe885aefad8a8333673c81ee4b8f7a6.1642751874.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76a60b77-4117-424a-f343-08d9dcb3da94
x-ms-traffictypediagnostic: PAYP264MB4205:EE_
x-microsoft-antispam-prvs: <PAYP264MB4205C6C67BC47B6012918FE9ED5B9@PAYP264MB4205.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:47;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mVFYd+ElDHOWznABd1Cl7QnDM8jg/dHSsJ5sCSa195Rcs/wFi0xyX42SAZnm4M2LNZUHdj3vCGNQRqYV94bIePH9v9Bjq3nthtt0TmPqI0gRlhkhkI84Aal9uP+Jogje4DQzXu8APV1Hv7OoRfTngmVoamj97fv26p+CiteE5lSNPOP/YooTEjj8LwdalBLkpKv2+wE3C/0gKoT8XQ2uKSNU479jQxmSpyu5kwuxbWup5Di84Z+mhXMs8jkht/Wa/OMD06aKDNqKO1BWzHg7mdlTJjuh1uMSCdLJ5O8Rn3CHmhWXgjsIVL1GaLkZE1gI9yo2Zy4T/GcwHAj3AGJNNoF+Re1nDX8R5Vv6LxlNYNO/fCCFelZTtscpt9fQO9qJol/UCYRzbwZIWLLBqDaL2s33opzPH9jOaWIgi+oji09A+SUW4yjGuginNAV9LLC0DYOJSjG/Z2TpvfJNANDP4v7gLHY/G5EieQGAAXrYhT1j4s9m3BLZ3dowykcDejqNqpE6LXPYFtDHCdM5m/OLAtrK7cAxQbOdYji6Tw0KFeI25XmpgR3SlnOEbFUXSFNH14S3eFch+Sx65+jNtYnDWgpIW/OC2M1hgVJDxT6xrqYcQ8ZveSoResqRjubG4Vx7wgKnAM3COI62Wo/qT+0IeN+poN3u04dbDcOCmqkl2bGhmywZnd/5+Ol5FjVt1BBDKA9/kyma8swhXmcD6Oid+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(86362001)(4326008)(26005)(6486002)(38070700005)(76116006)(91956017)(6512007)(2906002)(316002)(54906003)(5660300002)(186003)(6506007)(2616005)(38100700002)(122000001)(71200400001)(44832011)(83380400001)(110136005)(508600001)(64756008)(66476007)(8676002)(66556008)(66946007)(66446008)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BkvDXSIpYYWpJvyXZVU6XZ/oFjBE1EdlN9G0Cfq2pJliq8TQLX8MnsMNdW?=
 =?iso-8859-1?Q?kDOHOS4fbFb4vCoPurLOxjbqQ0AUWISOKKFwKA5yZ80hid/CypKSTQrADs?=
 =?iso-8859-1?Q?J1N8eWgI1WF3q2BHHJdYHnsBQAZZG5kV+ZvXblvZeco94EDzXEjK5qmMOo?=
 =?iso-8859-1?Q?IsVR3aYnUcLXDICwMLWNB5bXaKfekp/yRTr+1ymJgU13T8LpVO2GYN50v6?=
 =?iso-8859-1?Q?L7aJjlNa1Qu0O/wKgY3NRVeNvNTm2f3nNNENADjs1CefXoLLwJCEtGdoEo?=
 =?iso-8859-1?Q?2RIM3M/NIfbe709wzfKSnaz0Ki77ad+SstWbV8wCcuR4IAB73o2veFLvqt?=
 =?iso-8859-1?Q?yk4HtwHxVibF7GqOwbglFV46UbBt4WAJCDaQRh4zAbd6+f5C+XfHqALiwQ?=
 =?iso-8859-1?Q?H/NjzujOuz14JYS3Ck4l6aZHTqOXarok/fYD9ZL5QUccgjxDxgNO8iyyiK?=
 =?iso-8859-1?Q?AJNcTe4zeXtXt8Fkaa4FI0uA3KZ+3OTCVaQECmcm4nR0lFmsw9PEKLk8qL?=
 =?iso-8859-1?Q?drUzQ7KTRWSSdaSnK7HljPOklCExaFAQsep2M3nAEQ4Po4vg4qiMf6XMFB?=
 =?iso-8859-1?Q?wifuBj5MTz2O/JD4+UapQqVJ4EchmqCf0itSNFIvYFfcCV24fcIucc2ect?=
 =?iso-8859-1?Q?H9crGAtEq/KHMiICd7hLQvCxIvyXn8Q0aViU1M856xV5laVp4IdiNflzZ0?=
 =?iso-8859-1?Q?ePyVpoqEglU06tCHhoOeL5m7ai10dIzaYKzTTlhIgpnj8mvwCy6ZCCrRID?=
 =?iso-8859-1?Q?whPJxL5KeoVhWRUY9/2k5DSNGKENpVwVw7uFOZ9opjsspROunt2R02UO09?=
 =?iso-8859-1?Q?Xx1yIJCxOS6HfKWS4j//bO6xMJ0fUERJChjjr9PGjXlyN0fRPCBTGpwBM9?=
 =?iso-8859-1?Q?hDWKkJ9631GGudDK1846DtiqUONgsWq8RsZinn6zW6s5rVMpFAaWtq2adA?=
 =?iso-8859-1?Q?bQHERxAXRVWykiNy7dnPGkb1Xx2ek7LDQpvSBYUPn2xKa7B3u4AjcYXdse?=
 =?iso-8859-1?Q?XqaOYp9cydTq6Aiv7y3L1wVlaViTKrjEiFj9LTEzuSKxU6i3DS/S4bROG0?=
 =?iso-8859-1?Q?Iuz0M1/o5t9qHl53iWSXU/FdG+10ihYB+yOz7NRz1uj0GJxAmqqhEWEheu?=
 =?iso-8859-1?Q?Lq1ZVlNxtlVTvBSY3c1lG+MEDFmde/NOVsxTGy76wKFQODasdNQQZmiAUB?=
 =?iso-8859-1?Q?0AF57EoYQ/6Sv3sxkArAfYvo3qDDPgNls2QaArBxPvaTIV/x35TY+JAt+4?=
 =?iso-8859-1?Q?YGdUlFSnpwUCKBiLTJA7lzF/8ggHifCYbD4+rzShfhpL2PbzPbOX3kB9g/?=
 =?iso-8859-1?Q?l1oXyUoWAmSyLWu7SAq5zEbblqp8o/QPyvPf+TImENAiWBizDuHPJEoykA?=
 =?iso-8859-1?Q?eEShoFRpRUj04xmoIA0F4DB2YiQMTL+plfeYlb4W58vacqr2FkcN7c+hM9?=
 =?iso-8859-1?Q?AZbf8W9caqZ5SYlv8SesE5yhvgRD6ME9b/WBlHARvxlwIAfJ2I4HChJJAN?=
 =?iso-8859-1?Q?zGam7smZOn0iN+EtixCI5UmlPbHIJb73JXJ/MeuUWTSQVXeCFmBBk/+fyM?=
 =?iso-8859-1?Q?6+PjSRDYcxqfBdlt7KoI/1XuMJr34SMY+PFEFpOhUz3LLlnJzv6fyGM52h?=
 =?iso-8859-1?Q?e4LbqLQ/i5JYPa0dHey/J0Ovi+k6Pw5iyKrq/xSG60TaGfqcs8hfJxDqT3?=
 =?iso-8859-1?Q?ML2guVjzVUbaesKsNFo6tKxs/SxuP4oIXin+f9N0nEKTeyYNLiiHoyhhsa?=
 =?iso-8859-1?Q?MgLqk2J+Uit4XXeYMie1ut5l8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a60b77-4117-424a-f343-08d9dcb3da94
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 07:58:47.3149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lzd7VmRlgVS8Hf1cB7Zpyc5IiSAVNcDd4N9RFBl3Lg62c1bmVYzQ/qvAs8M0WZV5ExNIJne5ltDEVz/MvlUdfrBC4P6hn4GYKcjMy13RfQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB4205
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Two places deserve using the macro is_tsk_32bit_task() added by
commit 252745240ba0 ("powerpc/audit: Fix syscall_get_arch()")

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/ptrace/ptrace-view.c | 2 +-
 arch/powerpc/perf/perf_regs.c            | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel=
/ptrace/ptrace-view.c
index b8be1d6668b5..f15bc78caf71 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -841,7 +841,7 @@ static const struct user_regset_view user_ppc_compat_vi=
ew =3D {
=20
 const struct user_regset_view *task_user_regset_view(struct task_struct *t=
ask)
 {
-	if (IS_ENABLED(CONFIG_PPC64) && test_tsk_thread_flag(task, TIF_32BIT))
+	if (IS_ENABLED(CONFIG_COMPAT) && is_tsk_32bit_task(task))
 		return &user_ppc_compat_view;
 	return &user_ppc_native_view;
 }
diff --git a/arch/powerpc/perf/perf_regs.c b/arch/powerpc/perf/perf_regs.c
index 51d31b65e423..350dccb0143c 100644
--- a/arch/powerpc/perf/perf_regs.c
+++ b/arch/powerpc/perf/perf_regs.c
@@ -134,12 +134,10 @@ int perf_reg_validate(u64 mask)
=20
 u64 perf_reg_abi(struct task_struct *task)
 {
-#ifdef CONFIG_PPC64
-	if (!test_tsk_thread_flag(task, TIF_32BIT))
-		return PERF_SAMPLE_REGS_ABI_64;
+	if (is_tsk_32bit_task(task))
+		return PERF_SAMPLE_REGS_ABI_32;
 	else
-#endif
-	return PERF_SAMPLE_REGS_ABI_32;
+		return PERF_SAMPLE_REGS_ABI_64;
 }
=20
 void perf_get_regs_user(struct perf_regs *regs_user,
--=20
2.33.1
