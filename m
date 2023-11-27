Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DAA7FAB42
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 21:21:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s62PHsID;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfH773wFGz3cgN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 07:21:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s62PHsID;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfH6G19fKz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 07:21:09 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARKAl5D001494;
	Mon, 27 Nov 2023 20:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=ROsI72neNiMsrbDjpDAbOmRQTD42BFapmOHkosJ6S28=;
 b=s62PHsIDGV/1pFHXVtgSalIU+nDmEDRR9XERvpOLopQPCVhW11tdWq+3a7Pg501zObLG
 LBnzlsP2CDQWo+ygMT3SH/qBuYmhPzqXZ36uLo+rIDvglzC2C8XTOD5tOc7YF8B6ZFp4
 Xr0UhTTgyz5dK1j8zDOqdXPvBF8q/yLoTuHAADsECFo2hGWQscXIayYlwb9ZZ/jf9o8I
 jkNH9QKty9D0U/zelt7RD8bI1PmicW7wxKUxpnQz58caj/5EMyuD5gDhO3sjg21xNHzB
 Ha6NM1DbVQPjlSv7SWDSYxGC0owfXnOJ2USOQSHBZ7VaxWsXSvttQpMDetAreei5w7YB mQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3un0mdjdbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 20:20:56 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARJchIK018544;
	Mon, 27 Nov 2023 20:20:55 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwfjtrc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 20:20:55 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ARKKsw821168714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Nov 2023 20:20:54 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6026958057;
	Mon, 27 Nov 2023 20:20:54 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DB9758058;
	Mon, 27 Nov 2023 20:20:54 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Nov 2023 20:20:54 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
        linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,
        lkft-triage@lists.linaro.org, clang-built-linux <llvm@lists.linux.dev>,
        regressions@lists.linux.dev, open list <linux-kernel@vger.kernel.org>
Subject: Re: Powerpc: maple_defconfig: kernel/rtas_pci.c:46:5: error: no
 previous prototype for function 'rtas_read_config'
 [-Werror,-Wmissing-prototypes]
In-Reply-To: <CA+G9fYt0LLXtjSz+Hkf3Fhm-kf0ZQanrhUS+zVZGa3O+Wt2+vg@mail.gmail.com>
References: <CA+G9fYt0LLXtjSz+Hkf3Fhm-kf0ZQanrhUS+zVZGa3O+Wt2+vg@mail.gmail.com>
Date: Mon, 27 Nov 2023 14:20:54 -0600
Message-ID: <875y1n2bix.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tX3c5ral_rPt_9wQ1R492hQBUM4oY95E
X-Proofpoint-GUID: tX3c5ral_rPt_9wQ1R492hQBUM4oY95E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_19,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270141
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
Cc: Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naresh Kamboju <naresh.kamboju@linaro.org> writes:
> Following Powerpc maple_defconfig and other builds failed with gcc-13 / 8
> and clang toolchains on Linux next-20231127 tag.
>
>   build:
>     * gcc-8-cell_defconfig
>     * gcc-8-maple_defconfig
>     * gcc-8-tinyconfig
>     * gcc-13-tinyconfig
>     * gcc-13-cell_defconfig
>     * gcc-13-maple_defconfig
>     * clang-17-cell_defconfig
>     * clang-17-tinyconfig
>     * clang-17-maple_defconfig
>     * clang-nightly-cell_defconfig
>     * clang-nightly-maple_defconfig
>     * clang-nightly-tinyconfig
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Build logs:
> -----------
> arch/powerpc/kernel/rtas_pci.c:46:5: error: no previous prototype for
> function 'rtas_read_config' [-Werror,-Wmissing-prototypes]
>    46 | int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
>       |     ^
> arch/powerpc/kernel/rtas_pci.c:46:1: note: declare 'static' if the
> function is not intended to be used outside of this translation unit
>    46 | int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
>       | ^
>       | static
> arch/powerpc/kernel/rtas_pci.c:98:5: error: no previous prototype for
> function 'rtas_write_config' [-Werror,-Wmissing-prototypes]
>    98 | int rtas_write_config(struct pci_dn *pdn, int where, int size, u32 val)
>       |     ^
> arch/powerpc/kernel/rtas_pci.c:98:1: note: declare 'static' if the
> function is not intended to be used outside of this translation unit
>    98 | int rtas_write_config(struct pci_dn *pdn, int where, int size, u32 val)
>       | ^
>       | static
> 2 errors generated.
> make[5]: *** [scripts/Makefile.build:243:
> arch/powerpc/kernel/rtas_pci.o] Error 1

This appears to be a latent issue in this code... the prototypes for
rtas_read_config() and rtas_write_config() in asm/ppc-pci.h are guarded
by #ifdef CONFIG_EEH for some reason. So I would expect this to happen
whenever it is built with CONFIG_EEH disabled and -Wmissing-prototypes.

So I guess it's fallout from commit c6345dfa6e3e ("Makefile.extrawarn:
turn on missing-prototypes globally").

Unfortunately the resolution isn't as simple as moving the prototypes
out of the CONFIG_EEH-guarded region, but I think I'll have a fix for
this later today.
