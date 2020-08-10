Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3A12413F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 01:52:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQXnX4SXtzDqTy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 09:52:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=gregory.herrero@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=YJV8ewpx; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ9Pp3CrmzDqGp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 19:18:47 +1000 (AEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07A9Cani045424;
 Mon, 10 Aug 2020 09:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=6ZaDq5+3vPA17fiFYRQL93Cef6LMw2VJ5wtI2kQA9+M=;
 b=YJV8ewpxwdkZe+9c6oTM+v9AWMZ+zYdgj+VWr8QISVisYW+Fto+6snoc6hIdhebXSoXa
 vE4oQJ9YG3NS05aAvO71NfvmrI9iF7kIEPdbU446bC7wrC03txYYltM23tJqcwaG/sLU
 1P/F/ES4bJxH6LOmFO+C61U0O5qyuvDDeGFvq6UgqsD2AApN/lXCO7epi4XD+xIXXOXU
 4p5GwmChl2ZYIcXwqyWrQU6CFCtCw4WFCmQ6nJzyhWeeu5kb7heD0TNhTZP25YFdGBab
 j1ZX9gwmIqceijupB4KOEH4dTXqk5XYxba4jIyy6EbgNZCjwRFaamdaWF3dcUPjs+W45 3g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 32sm0mdd2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Aug 2020 09:17:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07A9DORU006393;
 Mon, 10 Aug 2020 09:17:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 32t5tr844q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 09:17:44 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07A9HZen018697;
 Mon, 10 Aug 2020 09:17:40 GMT
Received: from localhost (/10.175.207.128)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 10 Aug 2020 09:17:35 +0000
Date: Mon, 10 Aug 2020 11:17:30 +0200
From: Gregory Herrero <gregory.herrero@oracle.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] recordmcount: Fix build failure on non arm64
Message-ID: <20200810091730.GA3099@ltoracle>
References: <5ca1be21fa6ebf73203b45fd9aadd2bafb5e6b15.1597049145.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca1be21fa6ebf73203b45fd9aadd2bafb5e6b15.1597049145.git.christophe.leroy@csgroup.eu>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9708
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008100067
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9708
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1011
 suspectscore=1 mlxlogscore=999 priorityscore=1501 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100067
X-Mailman-Approved-At: Tue, 11 Aug 2020 09:50:46 +1000
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
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Mon, Aug 10, 2020 at 08:48:22AM +0000, Christophe Leroy wrote:
> Commit ea0eada45632 leads to the following build failure on powerpc:
> 
>   HOSTCC  scripts/recordmcount
> scripts/recordmcount.c: In function 'arm64_is_fake_mcount':
> scripts/recordmcount.c:440: error: 'R_AARCH64_CALL26' undeclared (first use in this function)
> scripts/recordmcount.c:440: error: (Each undeclared identifier is reported only once
> scripts/recordmcount.c:440: error: for each function it appears in.)
> make[2]: *** [scripts/recordmcount] Error 1
> 
> Make sure R_AARCH64_CALL26 is always defined.
> 
Oops, thanks for fixing this.

Acked-by: Gregory Herrero <gregory.herrero@oracle.com>

Greg

> Fixes: ea0eada45632 ("recordmcount: only record relocation of type R_AARCH64_CALL26 on arm64.")
> Cc: Gregory Herrero <gregory.herrero@oracle.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  scripts/recordmcount.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/recordmcount.c b/scripts/recordmcount.c
> index e59022b3f125..b9c2ee7ab43f 100644
> --- a/scripts/recordmcount.c
> +++ b/scripts/recordmcount.c
> @@ -42,6 +42,8 @@
>  #define R_ARM_THM_CALL		10
>  #define R_ARM_CALL		28
>  
> +#define R_AARCH64_CALL26	283
> +
>  static int fd_map;	/* File descriptor for file being modified. */
>  static int mmap_failed; /* Boolean flag. */
>  static char gpfx;	/* prefix for global symbol name (sometimes '_') */
> -- 
> 2.25.0
> 
