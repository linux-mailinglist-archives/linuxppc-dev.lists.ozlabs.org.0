Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B45FD524086
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 01:07:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz9XS3mWBz3cGk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 09:07:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lxUbqAEO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lxUbqAEO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz16S08hKz3brb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 02:47:27 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BESoKr028080;
 Wed, 11 May 2022 16:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=tjIW4ViQYza/lnoDnWyOhboEO5kjiPdt7taCyynzKFw=;
 b=lxUbqAEO3GqUpU+Tuw2IWXF1fzXIGSDn1j9FVHjMmFIPrrH/+bQrVN9PaaYcbEJhBJIr
 7d0t++ZFM6UKMdcnwcUF0YasHW2SP51KwmfPJnRgOou9+kRarIXLa3hIMjmu5cX5t3FO
 6rItwaIor28IfP+e6c0HY1HIerMLLjGg06tg70umpoMhCUKjDu0piWYCrZz/VisJ+s0b
 0DuyX+X+ttOZsVNhvwPdzqfPCbp/RA3MDqZWBEVZBj0PN/wvhGTqQYzQ4imgN+k8TjhU
 NC3v9IrNMZOoN56TSdKZo20ktYuMVwJV19grssXUZ/JxpGndCu9D0HmYa5fO310s9Ten QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0etx3406-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 16:46:00 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24BGebih023228;
 Wed, 11 May 2022 16:45:59 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0etx33y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 16:45:59 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24BGgY6p030999;
 Wed, 11 May 2022 16:45:56 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3fwgd8wsc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 16:45:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24BGjqsM27197764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 16:45:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA0B35204E;
 Wed, 11 May 2022 16:45:52 +0000 (GMT)
Received: from osiris (unknown [9.145.80.86])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id B9FCE52050;
 Wed, 11 May 2022 16:45:50 +0000 (GMT)
Date: Wed, 11 May 2022 18:45:49 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 22/30] panic: Introduce the panic post-reboot notifier list
Message-ID: <YnvoPe2cTS31qbjb@osiris>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-23-gpiccoli@igalia.com>
 <7017c234-7c73-524a-11b6-fefdd5646f59@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7017c234-7c73-524a-11b6-fefdd5646f59@igalia.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P8jYmW-Xe3lS0Lxn9LfjJuLQx8-pWyu5
X-Proofpoint-ORIG-GUID: 3EoVOe4XNkWaSjwGnBLNECSOqY142ccD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=429 bulkscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205110076
X-Mailman-Approved-At: Thu, 12 May 2022 09:06:31 +1000
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 linux-xtensa@linux-xtensa.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, john.ogness@linutronix.de,
 Alexander Gordeev <agordeev@linux.ibm.com>, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 mikelley@microsoft.com, arnd@arndb.de, bhe@redhat.com, corbet@lwn.net,
 paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, dyoung@redhat.com,
 vgoyal@redhat.com, mhiramat@kernel.org, pmladek@suse.com,
 dave.hansen@linux.intel.com, keescook@chromium.org,
 Vasily Gorbik <gor@linux.ibm.com>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 gregkh@linuxfoundation.org, bp@alien8.de, luto@kernel.org,
 linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 andriy.shevchenko@linux.intel.com, vkuznets@redhat.com,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com,
 Sven Schnelle <svens@linux.ibm.com>, kernel-dev@igalia.com,
 linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 09, 2022 at 11:16:10AM -0300, Guilherme G. Piccoli wrote:
> On 27/04/2022 19:49, Guilherme G. Piccoli wrote:
> > Currently we have 3 notifier lists in the panic path, which will
> > be wired in a way to allow the notifier callbacks to run in
> > different moments at panic time, in a subsequent patch.
> > 
> > But there is also an odd set of architecture calls hardcoded in
> > the end of panic path, after the restart machinery. They're
> > responsible for late time tunings / events, like enabling a stop
> > button (Sparc) or effectively stopping the machine (s390).
> > 
> > This patch introduces yet another notifier list to offer the
> > architectures a way to add callbacks in such late moment on
> > panic path without the need of ifdefs / hardcoded approaches.
> > 
> > Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> > Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Heiko Carstens <hca@linux.ibm.com>
> > Cc: Sven Schnelle <svens@linux.ibm.com>
> > Cc: Vasily Gorbik <gor@linux.ibm.com>
> > Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> 
> Hey S390/SPARC folks, sorry for the ping!
> 
> Any reviews on this V1 would be greatly appreciated, I'm working on V2
> and seeking feedback in the non-reviewed patches.

Sorry, missed that this is quite s390 specific. So, yes, this looks
good to me and nice to see that one of the remaining CONFIG_S390 in
common code will be removed!

For the s390 bits:
Acked-by: Heiko Carstens <hca@linux.ibm.com>
