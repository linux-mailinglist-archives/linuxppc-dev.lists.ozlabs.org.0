Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1397F0B30
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 05:03:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K89G41uV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYYlJ0Nwlz3cT0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 15:03:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K89G41uV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYYkT253Dz2xTR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 15:02:41 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK3cM0n015850;
	Mon, 20 Nov 2023 04:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Dyg2A8pBTlihuxq9bidFFuI+Yw6tA05ZHItVwO7h3Rk=;
 b=K89G41uVDE389ziLwv1uAphdc6kHSDBQf2mJwalMgu5dvyqGp3WyuOFhmKS4YgXXVJ9D
 VGT90pJpJCbD0f1pRm28etSBMgklZWKlEpQPar7i9yzzsb03szRopUdAUr9Aqk+3I1PS
 LbCl2wcJu6SGIh69BkSNbcbS6vn8/mdT7UzHjlfu7SpVyQ/sAIzLI/4svhYJ76AUrY0n
 IpiY/VyI+gN7nLsJF7aQ6G32QB6heqpZ0ssCOnldifcoaECspHo9tmR78ZGXSuWg+yAT
 St8do29wArZt9GG+plCdGGgnnoGtRKpb54xSpylDSVbj2Ka/+8d5/a/bIwKMZePIxNQn eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ufmv133xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 04:02:32 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AK3uPJ6012828;
	Mon, 20 Nov 2023 04:02:31 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ufmv133x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 04:02:31 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK1XYcv026613;
	Mon, 20 Nov 2023 04:02:30 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uf93kekkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 04:02:30 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AK42S8a5505736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Nov 2023 04:02:28 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDD092004B;
	Mon, 20 Nov 2023 04:02:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECA8E20040;
	Mon, 20 Nov 2023 04:02:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Nov 2023 04:02:27 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 71F2C603C2;
	Mon, 20 Nov 2023 15:02:26 +1100 (AEDT)
Message-ID: <f9eca9511866f942684b76dbc6df36f09cfae153.camel@linux.ibm.com>
Subject: Re: [PATCH v2 5/5] powerpc/rtas: Remove 'extern' from function
 declarations in rtas.h
From: Andrew Donnellan <ajd@linux.ibm.com>
To: nathanl@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
	Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Mon, 20 Nov 2023 15:02:26 +1100
In-Reply-To: <20231114-rtas-trivial-v2-5-59cbab208d57@linux.ibm.com>
References: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
	 <20231114-rtas-trivial-v2-5-59cbab208d57@linux.ibm.com>
Autocrypt: addr=ajd@linux.ibm.com; prefer-encrypt=mutual;
 keydata=mDMEZPaWfhYJKwYBBAHaRw8BAQdAAuMUoxVRwqphnsFua1W+WBz6I2cIn0+Ox4YypJSdBJ+0MEFuZHJldyBEb25uZWxsYW4gKElCTSBzdHVmZikgPGFqZEBsaW51eC5pYm0uY29tPoiTBBMWCgA7FiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQj1Qx8QRYRqAdswD8DhIh4trRQYiPe+7LaM7q+0+Thz+CwUJCW3UFOf0SEO0BAPNdsi7aVV+4Oah6nYzqzH5Zbs4Tz5RY+Vsf+DD/EzUKuDgEZPaWfhIKKwYBBAGXVQEFAQEHQLN9moJRqN8Zop/kcyIjga+2qzLoVaNAL6+4diGnlr1xAwEIB4h4BBgWCgAgFiEE01kE3s9shZVYLX1Aj1Qx8QRYRqAFAmT2ln4CGwwACgkQj1Qx8QRYRqCYkwD/W+gIP9kITfU4wnLtueFUThxA0T/LF49M7k31Qb8rPCwBALeEYAlX648lzjSA07pJB68Jt39FuUno444dSVmhYtoH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NEWz7uk543e6hFV-OMd9qihjgjdoEsTi
X-Proofpoint-ORIG-GUID: RsNyB9IYizDaJN3_ledjKnP7w-RpLQ8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_01,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311200027
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
Cc: linuxppc-dev@lists.ozlabs.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-11-14 at 11:22 -0600, Nathan Lynch via B4 Relay wrote:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>=20
> This header occasionally gains new function declarations without the
> leading extern in accordance with current style rules. Leaving the
> legacy externs in place is making the header more difficult to read
> over time because of the inconsistency. Remove them, fixing up
> checkpatch issues with unnamed parameters (rtas_call) and bracket
> alignment (early_init_dt_scan_rtas) that get raised as a result of
> touching the code.
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>'

LGTM

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0arch/powerpc/include/asm/rtas.h | 53 ++++++++++++++++++++----------=
-
> ----------
> =C2=A01 file changed, 26 insertions(+), 27 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/rtas.h
> b/arch/powerpc/include/asm/rtas.h
> index 1bed6be8ada3..a7110ed52e25 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -408,42 +408,41 @@ static inline bool
> rtas_function_implemented(const rtas_fn_handle_t handle)
> =C2=A0{
> =C2=A0	return rtas_function_token(handle) !=3D RTAS_UNKNOWN_SERVICE;
> =C2=A0}
> -extern int rtas_token(const char *service);
> -extern int rtas_call(int token, int, int, int *, ...);
> +int rtas_token(const char *service);
> +int rtas_call(int token, int nargs, int nret, int *outputs, ...);
> =C2=A0void rtas_call_unlocked(struct rtas_args *args, int token, int
> nargs,
> =C2=A0			int nret, ...);
> -extern void __noreturn rtas_restart(char *cmd);
> -extern void rtas_power_off(void);
> -extern void __noreturn rtas_halt(void);
> -extern void rtas_os_term(char *str);
> +void __noreturn rtas_restart(char *cmd);
> +void rtas_power_off(void);
> +void __noreturn rtas_halt(void);
> +void rtas_os_term(char *str);
> =C2=A0void rtas_activate_firmware(void);
> -extern int rtas_get_sensor(int sensor, int index, int *state);
> -extern int rtas_get_sensor_fast(int sensor, int index, int *state);
> -extern int rtas_get_power_level(int powerdomain, int *level);
> -extern int rtas_set_power_level(int powerdomain, int level, int
> *setlevel);
> -extern bool rtas_indicator_present(int token, int *maxindex);
> -extern int rtas_set_indicator(int indicator, int index, int
> new_value);
> -extern int rtas_set_indicator_fast(int indicator, int index, int
> new_value);
> -extern void rtas_progress(char *s, unsigned short hex);
> +int rtas_get_sensor(int sensor, int index, int *state);
> +int rtas_get_sensor_fast(int sensor, int index, int *state);
> +int rtas_get_power_level(int powerdomain, int *level);
> +int rtas_set_power_level(int powerdomain, int level, int *setlevel);
> +bool rtas_indicator_present(int token, int *maxindex);
> +int rtas_set_indicator(int indicator, int index, int new_value);
> +int rtas_set_indicator_fast(int indicator, int index, int
> new_value);
> +void rtas_progress(char *s, unsigned short hex);
> =C2=A0int rtas_ibm_suspend_me(int *fw_status);
> =C2=A0int rtas_error_rc(int rtas_rc);
> =C2=A0
> =C2=A0struct rtc_time;
> -extern time64_t rtas_get_boot_time(void);
> -extern void rtas_get_rtc_time(struct rtc_time *rtc_time);
> -extern int rtas_set_rtc_time(struct rtc_time *rtc_time);
> +time64_t rtas_get_boot_time(void);
> +void rtas_get_rtc_time(struct rtc_time *rtc_time);
> +int rtas_set_rtc_time(struct rtc_time *rtc_time);
> =C2=A0
> -extern unsigned int rtas_busy_delay_time(int status);
> +unsigned int rtas_busy_delay_time(int status);
> =C2=A0bool rtas_busy_delay(int status);
> =C2=A0
> -extern int early_init_dt_scan_rtas(unsigned long node,
> -		const char *uname, int depth, void *data);
> +int early_init_dt_scan_rtas(unsigned long node, const char *uname,
> int depth, void *data);
> =C2=A0
> -extern void pSeries_log_error(char *buf, unsigned int err_type, int
> fatal);
> +void pSeries_log_error(char *buf, unsigned int err_type, int fatal);
> =C2=A0
> =C2=A0#ifdef CONFIG_PPC_PSERIES
> =C2=A0extern time64_t last_rtas_event;
> -extern int clobbering_unread_rtas_event(void);
> +int clobbering_unread_rtas_event(void);
> =C2=A0int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
> =C2=A0#else
> =C2=A0static inline int clobbering_unread_rtas_event(void) { return 0; }
> @@ -454,7 +453,7 @@ static inline int
> rtas_syscall_dispatch_ibm_suspend_me(u64 handle)
> =C2=A0#endif
> =C2=A0
> =C2=A0#ifdef CONFIG_PPC_RTAS_DAEMON
> -extern void rtas_cancel_event_scan(void);
> +void rtas_cancel_event_scan(void);
> =C2=A0#else
> =C2=A0static inline void rtas_cancel_event_scan(void) { }
> =C2=A0#endif
> @@ -479,7 +478,7 @@ static inline void rtas_cancel_event_scan(void) {
> }
> =C2=A0 *=C2=A0 for all rtas calls that require an error buffer argument.
> =C2=A0 *=C2=A0 This includes 'check-exception' and 'rtas-last-error'.
> =C2=A0 */
> -extern int rtas_get_error_log_max(void);
> +int rtas_get_error_log_max(void);
> =C2=A0
> =C2=A0/* Event Scan Parameters */
> =C2=A0#define EVENT_SCAN_ALL_EVENTS	0xf0000000
> @@ -518,8 +517,8 @@ static inline u32 rtas_config_addr(int busno, int
> devfn, int reg)
> =C2=A0			(devfn << 8) | (reg & 0xff);
> =C2=A0}
> =C2=A0
> -extern void rtas_give_timebase(void);
> -extern void rtas_take_timebase(void);
> +void rtas_give_timebase(void);
> +void rtas_take_timebase(void);
> =C2=A0
> =C2=A0#ifdef CONFIG_PPC_RTAS
> =C2=A0static inline int page_is_rtas_user_buf(unsigned long pfn)
> @@ -532,7 +531,7 @@ static inline int page_is_rtas_user_buf(unsigned
> long pfn)
> =C2=A0
> =C2=A0/* Not the best place to put pSeries_coalesce_init, will be fixed
> when we
> =C2=A0 * move some of the rtas suspend-me stuff to pseries */
> -extern void pSeries_coalesce_init(void);
> +void pSeries_coalesce_init(void);
> =C2=A0void rtas_initialize(void);
> =C2=A0#else
> =C2=A0static inline int page_is_rtas_user_buf(unsigned long pfn) { return
> 0;}
>=20

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
