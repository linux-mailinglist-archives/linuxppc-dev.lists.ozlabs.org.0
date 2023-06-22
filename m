Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7573ADE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 02:36:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jYYfGeGR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnJG32QSsz3bcH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 10:36:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jYYfGeGR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn5M34pBZz30Mv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 02:25:19 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35MGGlKS013633;
	Thu, 22 Jun 2023 16:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=qD1qlhKCKV9Gk/Gjt6jadS5UFlsWxSGO0aUPUrItqzs=;
 b=jYYfGeGRQ3zLxjiAvNda/y4OI0ywP/4TVxqY691pSz9R4RSvpFS617nUYNj5UUutDpom
 UleDGVAcUhDXI+PuKYQkAWE61q0e1MrEx59dpSq0lnGywnAQCTuVXeIzei8NNSg3y1yt
 XgqXarDC/ZJzCx1hV/X+HF+DKQG9z+Q54SXgv+ppPs2lEa5WuSvXEkNqNsJWWhW94mg/
 6QMJW+Al7D23OIoT2g86XUFe3uWxhCGdhwQvlEcu+N2jps3uYBviGEJeLHNYiHumKmZb
 b+lkg15evovpPWtaS8fTKKOPolOBeanzafGNt614LBgCD/xl7rhZ7zwuo0Ez0+4Vt5dv zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rcsfkrskb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 16:24:16 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35MG49ni025954;
	Thu, 22 Jun 2023 16:24:15 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rcsfkrsj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 16:24:15 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35M9kkIB029518;
	Thu, 22 Jun 2023 16:24:13 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r943e3kjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jun 2023 16:24:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35MGO9tV10420856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jun 2023 16:24:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29FCA20043;
	Thu, 22 Jun 2023 16:24:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77E2320040;
	Thu, 22 Jun 2023 16:24:05 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.171.59.34])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 22 Jun 2023 16:24:05 +0000 (GMT)
Date: Thu, 22 Jun 2023 18:24:03 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v2 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <ZJR1o0lzhIUdpTb+@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-13-eric.devolder@oracle.com>
 <ZJKD690QaX1IgiAz@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <b89bb8d6-77db-76fe-e360-f6c439b80e73@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b89bb8d6-77db-76fe-e360-f6c439b80e73@oracle.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qCenS3OA9UceHHV25yycwEWlCVqc_XCw
X-Proofpoint-GUID: t_YQDqT-rDR4fb7suT2OXhiuNh4-PXUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_11,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220136
X-Mailman-Approved-At: Fri, 23 Jun 2023 10:35:05 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Mimi Zohar <zohar@linux.ibm.com>, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.co
 m, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 21, 2023 at 12:10:49PM -0500, Eric DeVolder wrote:
Hi Eric,
...
> > > NOTE: The original Kconfig has a KEXEC_SIG which depends on
> > > MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
> > > dependency (using the strategy outlined in this series, and other
> > > techniques) results in 'error: recursive dependency detected'
> > > on CRYPTO. This occurs due to any path through KEXEC_SIG
> > > attempting to select CRYPTO is ultimately dependent upon CRYPTO:
> > > 
> > >   CRYPTO
> > >    <- ARCH_SUPPORTS_KEXEC_FILE
> > >       <- KEXEC_FILE
> > >          <- KEXEC_SIG
> > > 
> > > Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
> > > for KEXEC_SIG. In practice, however, MODULE_SIG_FORMAT is still
> > > configured-in as the use of KEXEC_SIG is in step with the use of
> > > SYSTEM_DATA_VERIFICATION, which does select MODULE_SIG_FORMAT.
> > 
> > No, it is actually the other way around.
> > Could you please provide the correct explanation?
> > 
> > AFAICT the MODULE_SIG_FORMAT dependency was introduced with commit
> > c8424e776b09 ("MODSIGN: Export module signature definitions") and
> > in fact was not necessary, since s390 did/does not use mod_check_sig()
> > anyway. So the SYSTEM_DATA_VERIFICATION could have left intact.
> 
> Thomas, would the correct explanation be simply indicating that
> MODULE_SIG_FORMAT isn't needed as it is not used by s390 (crediting your
> summary above)?

I guess, you asked me? Anyway, I will try to answer as if I were Thomas :)

MODULE_SIG_FORMAT is needed to select SYSTEM_DATA_VERIFICATION.
But SYSTEM_DATA_VERIFICATION is also selected by FS_VERITY*, so
dropping MODULE_SIG_FORMAT does not hurt.

Thanks!
