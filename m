Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEDD7B69A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 02:15:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yv8q2k7QzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 10:15:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yv4c5vhCzDqXl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 10:12:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45yv4c3rjJz8tQV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 10:12:16 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45yv4c2lm7z9s3l; Wed, 31 Jul 2019 10:12:16 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45yv4b601sz9sDQ
 for <linuxppc-dev@ozlabs.org>; Wed, 31 Jul 2019 10:12:15 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6V07I0k082099; Tue, 30 Jul 2019 20:12:04 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u2ypugyee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2019 20:12:04 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6V06BWn012459;
 Wed, 31 Jul 2019 00:12:03 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 2u0e85u004-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Jul 2019 00:12:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6V0C2pi49545662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 00:12:02 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AFE378067;
 Wed, 31 Jul 2019 00:12:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA74A78060;
 Wed, 31 Jul 2019 00:12:00 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.162.191])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 31 Jul 2019 00:12:00 +0000 (GMT)
References: <20190728125438.1550-1-cmr@informatik.wtf>
 <20190728125438.1550-2-cmr@informatik.wtf>
 <87ef27us38.fsf@morokweng.localdomain>
 <1271264633.409807.1564529492813@privateemail.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Christopher M Riedl <cmr@informatik.wtf>
Subject: Re: [PATCH 1/3] powerpc/spinlocks: Refactor SHARED_PROCESSOR
In-reply-to: <1271264633.409807.1564529492813@privateemail.com>
Date: Tue, 30 Jul 2019 21:11:53 -0300
Message-ID: <87d0hrukom.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907310000
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
Cc: linuxppc-dev@ozlabs.org, linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Christopher M Riedl <cmr@informatik.wtf> writes:

>> On July 30, 2019 at 4:31 PM Thiago Jung Bauermann <bauerman@linux.ibm.co=
m> wrote:
>>
>>
>>
>> Christopher M. Riedl <cmr@informatik.wtf> writes:
>>
>> > Determining if a processor is in shared processor mode is not a consta=
nt
>> > so don't hide it behind a #define.
>> >
>> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
>> > ---
>> >  arch/powerpc/include/asm/spinlock.h | 21 +++++++++++++++------
>> >  1 file changed, 15 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/includ=
e/asm/spinlock.h
>> > index a47f827bc5f1..8631b0b4e109 100644
>> > --- a/arch/powerpc/include/asm/spinlock.h
>> > +++ b/arch/powerpc/include/asm/spinlock.h
>> > @@ -101,15 +101,24 @@ static inline int arch_spin_trylock(arch_spinloc=
k_t *lock)
>> >
>> >  #if defined(CONFIG_PPC_SPLPAR)
>> >  /* We only yield to the hypervisor if we are in shared processor mode=
 */
>> > -#define SHARED_PROCESSOR (lppaca_shared_proc(local_paca->lppaca_ptr))
>> >  extern void __spin_yield(arch_spinlock_t *lock);
>> >  extern void __rw_yield(arch_rwlock_t *lock);
>> >  #else /* SPLPAR */
>> >  #define __spin_yield(x)	barrier()
>> >  #define __rw_yield(x)	barrier()
>> > -#define SHARED_PROCESSOR	0
>> >  #endif
>> >
>> > +static inline bool is_shared_processor(void)
>> > +{
>> > +/* Only server processors have an lppaca struct */
>> > +#ifdef CONFIG_PPC_BOOK3S
>> > +	return (IS_ENABLED(CONFIG_PPC_SPLPAR) &&
>> > +		lppaca_shared_proc(local_paca->lppaca_ptr));
>> > +#else
>> > +	return false;
>> > +#endif
>> > +}
>> > +
>>
>> CONFIG_PPC_SPLPAR depends on CONFIG_PPC_PSERIES, which depends on
>> CONFIG_PPC_BOOK3S so the #ifdef above is unnecessary:
>>
>> if CONFIG_PPC_BOOK3S is unset then CONFIG_PPC_SPLPAR will be unset as
>> well and the return expression should short-circuit to false.
>>
>
> Agreed, but the #ifdef is necessary to compile platforms which include
> this header but do not implement lppaca_shared_proc(...) and friends.
> I can reword the comment if that helps.

Ah, indeed. Yes, if you could mention that in the commit I think it
would help. These #ifdefs are becoming d=C3=A9mod=C3=A9 so it's good to kno=
w why
they're there.

Another alternative is to provide a dummy lppaca_shared_proc() which
always returns false when CONFIG_PPC_BOOK3S isn't set (just mentioning
it, I don't have a preference).

--
Thiago Jung Bauermann
IBM Linux Technology Center
