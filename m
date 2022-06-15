Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77054BF66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 03:48:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LN7W86Fsqz3cdn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 11:48:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UAwhROCz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UAwhROCz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LN7VP4Bjyz3bm5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 11:47:56 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25F09bEd015403;
	Wed, 15 Jun 2022 01:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=AvB6z0pX/ML68WVK1mUyVq/qy5lExESPnp3K5RUkCSI=;
 b=UAwhROCzLLX1Lfs1s7f+TMbd0WwRcZb8gHrYCnpyylE5T4rQediN2GCOJnj6y81nVz8T
 PNYRnopIl74hIzWPHpJZE8lSI92qe9ZTjUAA49OWR9sUpnVgz1Tslb70sSwqADS8Ierf
 /bJJwrRFs90zgLk8zdCmT6Q1HOXjYV+BveW9+kfCATiQz65L3slgeLKDOmysZq47CBpR
 4wpvshdl9w8Hj0nBPzopfqnoTaZgnp/QJpw1lsClAfCFlUTceqyytjrpRVlUF6TPMIka
 kmNQcngbP2mykTMFkqvk9ZmUtTvXC/4RZ5nVFLrDTOAlOEm45p8TpoFDVhxaahhpxBLc Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpqmw8sq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jun 2022 01:47:50 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25F1eOUU003338;
	Wed, 15 Jun 2022 01:47:50 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gpqmw8spp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jun 2022 01:47:50 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25F1aG2q007455;
	Wed, 15 Jun 2022 01:47:48 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma05fra.de.ibm.com with ESMTP id 3gmjp93wxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jun 2022 01:47:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25F1lnEC14549502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jun 2022 01:47:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B879B42041;
	Wed, 15 Jun 2022 01:47:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27F954203F;
	Wed, 15 Jun 2022 01:47:44 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.192.255.94])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Wed, 15 Jun 2022 01:47:43 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CAK8P3a3jm=02geTcJcfLNpshx1bR1jAnLTzimaaAhB=mGHfJzg@mail.gmail.com>
Date: Wed, 15 Jun 2022 11:47:41 +1000
Content-Transfer-Encoding: quoted-printable
Message-Id: <494F2A0A-1C03-4A5A-8BC1-92ACCE34AFE4@linux.ibm.com>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
 <20220601054850.250287-2-rmclure@linux.ibm.com>
 <CAK8P3a3jm=02geTcJcfLNpshx1bR1jAnLTzimaaAhB=mGHfJzg@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IaznAoPWEkZiq-lxV0spF1_hpO_7YdGk
X-Proofpoint-ORIG-GUID: vvg-51kGnbXC3SSxaWosPMma7dVc1lB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_10,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=814 spamscore=0
 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206150002
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Andrew Donnellan <ajd@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On 3 Jun 2022, at 7:04 pm, Arnd Bergmann <arnd@arndb.de> wrote:
>=20
> On Wed, Jun 1, 2022 at 7:48 AM Rohan McLure <rmclure@linux.ibm.com> =
wrote:
>>=20
>> Syscall wrapper implemented as per s390, x86, arm64, providing the
>> option for gprs to be cleared on entry to the kernel, reducing caller
>> influence influence on speculation within syscall routine. The =
wrapper
>> is a macro that emits syscall handler implementations with parameters
>> passed by stack pointer.
>>=20
>> For platforms supporting this syscall wrapper, emit symbols with =
usual
>> in-register parameters (`sys...`) to support calls to syscall =
handlers
>> from within the kernel.
>=20
> Nice work!
>=20
>> Syscalls are wrapped on all platforms except Cell processor. SPUs =
require
>> access syscall prototypes which are omitted with =
ARCH_HAS_SYSCALL_WRAPPER
>> enabled.
>=20
> Right, I think it's ok to leave out the SPU side. In the long run, I
> would like to
> go back to requiring the prototypes for everything on all =
architectures, to
> enforce type checking, but that's a separate piece of work.
>=20
>> +/*
>> + * For PowerPC specific syscall implementations, wrapper takes exact =
name and
>> + * return type for a given function.
>> + */
>> +
>> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>> +#define PPC_SYSCALL_DEFINE(x, type, name, ...)                       =
          \
>> +       asmlinkage type __powerpc_##name(const struct pt_regs *regs); =
          \
>> +       ALLOW_ERROR_INJECTION(__powerpc_##name, ERRNO);               =
          \
>> +       type sys_##name(__MAP(x,__SC_DECL,__VA_ARGS__));              =
          \
>> +       static type __se_##name(__MAP(x,__SC_LONG,__VA_ARGS__));      =
          \
>> +       static inline type =
__do_##name(__MAP(x,__SC_DECL,__VA_ARGS__));         \
>=20
> What is the benefit of having a separate set of macros for this? I =
think that
> adds more complexity than it saves in the end.
>=20
>> @@ -68,52 +69,63 @@ unsigned long compat_sys_mmap2(unsigned long =
addr, size_t len,
>> #define merge_64(high, low) ((u64)high << 32) | low
>> #endif
>>=20
>> -compat_ssize_t compat_sys_pread64(unsigned int fd, char __user =
*ubuf, compat_size_t count,
>> -                            u32 reg6, u32 pos1, u32 pos2)
>> +PPC_SYSCALL_DEFINE(6, compat_ssize_t, compat_sys_pread64,
>> +                  unsigned int, fd,
>> +                  char __user *, ubuf, compat_size_t, count,
>> +                  u32, reg6, u32, pos1, u32, pos2)
>> {
>>       return ksys_pread64(fd, ubuf, count, merge_64(pos1, pos2));
>> }
>=20
> We now have generalized versions of most of these system calls, as of =
5.19-rc1
> with the addition of the riscv compat support. I think it would be
> best to try removing
> the powerpc private versions wherever possible and use the common =
version,
> modifying it further where necessary.
>=20
> If this doesn't work for some of the syscalls, can you use the
> COMPAT_SYSCALL_DEFINE for those in place of PPC_SYSCALL_DEFINE?
>=20
>    Arnd

Hi Arnd,

Thanks for your comments.=20

> What is the benefit of having a separate set of macros for this? I =
think that
> adds more complexity than it saves in the end.

I was unsure whether the exact return types needed to be respected for =
syscall
handlers or not. I realise that under the existing behaviour,
system_call_exception performs an indirect call, the return type of =
which is
interpreted as a long, so the return type should be irrelevant. On =
inspection
PPC_SYSCALL_DEFINE is readily replacable with COMPAT_SYSCALL_DEFINE as =
you
have suggested.

Before resubmitting this series, I will try for a patch series which =
modernises
syscall handlers in arch/powerpc, and inspect where powerpc private =
versions
are strictly necessary, using __ARCH_WANT_... wherever possible.

Rohan=
