Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDDD28D4EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 21:47:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9mKd3hhyzDqdt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 06:47:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ofbmEHpj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9mHq4fByzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 06:45:58 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09DJY4d0179336; Tue, 13 Oct 2020 15:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=wjgRi0JKXCA+0MevYmBRStAWxi1vVqqvVpMDV3OGaHY=;
 b=ofbmEHpj/HiqpFVYoUpJc1CptudDCiqJuewrLBlLd6fhph58Ir1kclCkuSUK3j5p/MFY
 FUoYrmA4nYUwMkULfI4E4GgR4bXVatntZGhq4QDgtZ+KxJxJfQHR2WtMDvdNXnhVsc2p
 ivS4wEeclmH6hZb3G116bEJYT8Pho6nMCSMgFA5ZWhEDoxaHnF0nt14Dwd+lfYDRAYCJ
 kUL4KuoOa8hascylFLRFbKk3K8BtRPSGjoU8xyoA/bo0Vk/kcZ0UdRWHezWBq8ZLRuLS
 FZusq++dnZSSJ9Akli9JVrLK28+6vAZS5HrgVgZnoxXGRbogqhvx0xAsZkQMOOUGiGSJ AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345jac8k3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 15:45:50 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09DJYlcD184984;
 Tue, 13 Oct 2020 15:45:49 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345jac8k37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 15:45:49 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09DJbP5F001513;
 Tue, 13 Oct 2020 19:45:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3434k81s1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 19:45:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09DJjiBN17236448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Oct 2020 19:45:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEDA511C050;
 Tue, 13 Oct 2020 19:45:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D215111C054;
 Tue, 13 Oct 2020 19:45:42 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.65.195])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Oct 2020 19:45:42 +0000 (GMT)
Message-ID: <6a4ad1dbf6d7a59b3728f3847fdbea04b73aff69.camel@linux.ibm.com>
Subject: Re: [PATCH v2] ima: defer arch_ima_get_secureboot() call to IMA
 init time
From: Mimi Zohar <zohar@linux.ibm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 13 Oct 2020 15:45:41 -0400
In-Reply-To: <CAMj1kXFZVR46_oeYTxJ59q-7u+zFCFtOQuSQoiEzKLhXzpydow@mail.gmail.com>
References: <20201013081804.17332-1-ardb@kernel.org>
 <ae9ab2560f6d7b114726efb1ec26f0a36f695335.camel@linux.ibm.com>
 <CAMj1kXFZVR46_oeYTxJ59q-7u+zFCFtOQuSQoiEzKLhXzpydow@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-13_13:2020-10-13,
 2020-10-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=995
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010130137
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <jmorris@namei.org>,
 Chester Lin <clin@suse.com>, linux-security-module@vger.kernel.org,
 linux-integrity <linux-integrity@vger.kernel.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-10-13 at 18:59 +0200, Ard Biesheuvel wrote:
> Suggestion: can we take the get_sb_mode() code from ima_arch.c in
> arch/x86, and generalize it for all EFI architectures? That way, we
> can enable 32-bit ARM and RISC-V seamlessly once someone gets around
> to enabling IMA on those platforms. In fact, get_sb_mode() itself
> should probably be factored out into a generic helper for use outside
> of IMA as well (Xen/x86 has code that does roughly the same already)

On Power, there are three different policies - secure, trusted, and
secure & trusted boot policy rules.  Based on whether secure or trusted
boot is enabled, the appropriate policy is enabled.  On x86, if
secure_boot is enabled (and CONFIG_IMA_ARCH_POLICY is enabled) both the
secure and trusted boot rules are defined.  Is this design fine enough
granularity or should should there be a get_trustedboot_mode() function
as well?

Agreed, the code should not be duplicated across arch's.  As for making
get_sb_mode() generic, not dependent on IMA, where would it reside? 
Would this be in EFI?

thanks,

Mimi

