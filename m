Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 689951E4364
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 15:19:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XBJM4gKyzDqRx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 23:19:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=alan.maguire@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=I++iBdw/; 
 dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X6306jm2zDqJV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 20:07:53 +1000 (AEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04RA7bN9029643;
 Wed, 27 May 2020 10:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : in-reply-to : message-id : references : mime-version :
 content-type; s=corp-2020-01-29;
 bh=Jgk+aa3gaSbaEJGRzqmUB4J/D3RcAW2mzmSgXwtDYpI=;
 b=I++iBdw/d6EbbsVc0QonMYtP9GdH7G9gqk7JTiB94+7WbFWe/ILrE7Z3/1Xou2AA/fj0
 XfiW1ia3B13QNes64K8EvFxGTdek2n1b1W/CZkKh0BNspXqu5WHk3CdXeMTM9mLZJxGW
 HOtff/B6xDcXoVujMkSWvLLR+R8xcPpBHqJLZ0kEdQhnfyRw8J6J6VCNosFSIaEu0thm
 Xz1cn4ch5LgZ1tUZIBA3t8NTvbbgSWEt29tV/Ak2G+yNA1HvzCz/bBs7k698p7fC90vO
 0n/SEPzLJEx2JmH8cX0h5LZ95k2fkDoJBgdt9g4Ud68tggcn37DEw46UAI4yWToBi71J Lg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 316u8qxjjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 27 May 2020 10:07:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04R9vY3D160684;
 Wed, 27 May 2020 10:05:35 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 317j5rcya4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 May 2020 10:05:35 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04RA5XM3005085;
 Wed, 27 May 2020 10:05:33 GMT
Received: from dhcp-10-175-217-36.vpn.oracle.com (/10.175.217.36)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 27 May 2020 03:05:33 -0700
Date: Wed, 27 May 2020 11:05:23 +0100 (BST)
From: Alan Maguire <alan.maguire@oracle.com>
X-X-Sender: alan@localhost
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 3/7] kunit: tests for stats_fs API
In-Reply-To: <20200526110318.69006-4-eesposit@redhat.com>
Message-ID: <alpine.LRH.2.21.2005271054360.24819@localhost>
References: <20200526110318.69006-1-eesposit@redhat.com>
 <20200526110318.69006-4-eesposit@redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9633
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 suspectscore=4
 mlxlogscore=999 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005270072
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9633
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 priorityscore=1501 spamscore=0 cotscore=-2147483648 suspectscore=4
 phishscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005270073
X-Mailman-Approved-At: Wed, 27 May 2020 23:10:40 +1000
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, kunit-dev@googlegroups.com,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Jonathan Adams <jwadams@google.com>, brendanhiggins@google.com,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kselftest@vger.kernel.org,
 David Rientjes <rientjes@google.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 26 May 2020, Emanuele Giuseppe Esposito wrote:

> Add kunit tests to extensively test the stats_fs API functionality.
>

I've added in the kunit-related folks.
 
> In order to run them, the kernel .config must set CONFIG_KUNIT=y
> and a new .kunitconfig file must be created with CONFIG_STATS_FS=y
> and CONFIG_STATS_FS_TEST=y
>

It looks like CONFIG_STATS_FS is built-in, but it exports
much of the functionality you are testing.  However could the
tests also be built as a module (i.e. make CONFIG_STATS_FS_TEST
a tristate variable)? To test this you'd need to specify
CONFIG_KUNIT=m and CONFIG_STATS_FS_TEST=m, and testing would
simply be a case of "modprobe"ing the stats fs module and collecting
results in /sys/kernel/debug/kunit/<module_name> (rather 
than running kunit.py). Are you relying on unexported internals in
the the tests that would prevent building them as a module?

Thanks!

Alan
