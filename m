Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B3024E26F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 23:10:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYDh32184zDrBZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 07:10:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m1fJfzm5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BYDf323lqzDrBZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 07:08:58 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07LL4N1w099530; Fri, 21 Aug 2020 17:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tWHnnlJoYp9LodVGMbr2aIxmnbhjp0eY0MsxhOHymxw=;
 b=m1fJfzm5V6BaZukeBoN5AHBplVNsba17UzqeUMZUmMHaojgoaGQny0cbbOfVfHDwDeCX
 NIcx+IZil82L20BP/Ec6VYmykv5UITtGa0M2G41X5nJObxsLiPVuqurKCu2xQ+p2PI7N
 3f0kA90uVLntbSigG+DbNlHlVP3U3DQriPkF3yJPdsozEI8PV4O20+4KF8O3g863BxDa
 3sVYL/sr2qDeCuT0xSh95n9p7TOt6GYPKnenmey2QIN8WW+TNS0P5xh5On4DHA/6F7CA
 tvRYve6Z2N+6AjHPyfCuFZIcySycxks1eDSMk5SNpDrPRrZ57S6c1LduyFuw9rYVjaJT lw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 332hdd74cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Aug 2020 17:08:51 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07LL5OFd009108;
 Fri, 21 Aug 2020 21:08:50 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3304uresms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Aug 2020 21:08:50 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07LL8kmc60555636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Aug 2020 21:08:46 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BEA8C605D;
 Fri, 21 Aug 2020 21:08:49 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3984C605B;
 Fri, 21 Aug 2020 21:08:47 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.67.173])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Aug 2020 21:08:47 +0000 (GMT)
Subject: Re: [PATCH] tty: hvcs: Don't NULL tty->driver_data until
 hvcs_cleanup()
To: gregkh@linuxfoundation.org
References: <20200820234643.70412-1-tyreld@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <096400db-d454-d254-aa30-437352360f7f@linux.ibm.com>
Date: Fri, 21 Aug 2020 14:08:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200820234643.70412-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-21_10:2020-08-21,
 2020-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=3 lowpriorityscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008210195
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
Cc: Joe Perches <joe@perches.com>,
 "open list:HYPERVISOR VIRTUAL CONSOLE DRIVER"
 <linuxppc-dev@lists.ozlabs.org>, Jiri Slaby <jirislaby@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Jason Yan <yanaijie@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/20/20 4:46 PM, Tyrel Datwyler wrote:
> The code currently NULLs tty->driver_data in hvcs_close() with the
> intent of informing the next call to hvcs_open() that device needs to be
> reconfigured. However, when hvcs_cleanup() is called we copy hvcsd from
> tty->driver_data which was previoulsy NULLed by hvcs_close() and our
> call to tty_port_put(&hvcsd->port) doesn't actually do anything since
> &hvcsd->port ends up translating to NULL by chance. This has the side
> effect that when hvcs_remove() is called we have one too many port
> references preventing hvcs_destuct_port() from ever being called. This
> also prevents us from reusing the /dev/hvcsX node in a future
> hvcs_probe() and we can eventually run out of /dev/hvcsX devices.
> 
> Fix this by waiting to NULL tty->driver_data in hvcs_cleanup().

I just realized I neglected a Fixes tag.

Fixes: 27bf7c43a19c ("TTY: hvcs, add tty install")

-Tyrel

> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  drivers/tty/hvc/hvcs.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
> index 55105ac38f89..509d1042825a 100644
> --- a/drivers/tty/hvc/hvcs.c
> +++ b/drivers/tty/hvc/hvcs.c
> @@ -1216,13 +1216,6 @@ static void hvcs_close(struct tty_struct *tty, struct file *filp)
>  
>  		tty_wait_until_sent(tty, HVCS_CLOSE_WAIT);
>  
> -		/*
> -		 * This line is important because it tells hvcs_open that this
> -		 * device needs to be re-configured the next time hvcs_open is
> -		 * called.
> -		 */
> -		tty->driver_data = NULL;
> -
>  		free_irq(irq, hvcsd);
>  		return;
>  	} else if (hvcsd->port.count < 0) {
> @@ -1237,6 +1230,13 @@ static void hvcs_cleanup(struct tty_struct * tty)
>  {
>  	struct hvcs_struct *hvcsd = tty->driver_data;
>  
> +	/*
> +	 * This line is important because it tells hvcs_open that this
> +	 * device needs to be re-configured the next time hvcs_open is
> +	 * called.
> +	 */
> +	tty->driver_data = NULL;
> +
>  	tty_port_put(&hvcsd->port);
>  }
>  
> 

