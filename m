Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CEE32AA04
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 20:11:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqmvN5CGsz3d28
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 06:11:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PPpuxSi0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PPpuxSi0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqmty0DBCz30LL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 06:11:04 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122J5EEV027328; Tue, 2 Mar 2021 14:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qAG5xfr4ga6rSb4QwNCXooGmvsPVXs5R9sVsHP8bXoA=;
 b=PPpuxSi0/UCL2gTG3sVe/HkOKSKROzr8kukgK499nYD6lWWpvgrjOkWfbqop6pVGtOLg
 mDEEGIaTMzdpuT2h6KBn8hRVBKZOM21+s8YB8PX3Ncyn6rHwI7IZbAbpGMxsmXJuPU34
 hjr/mnw+R29JkRIT+CgY5t6wvMDSzd8ZDUNTHaxcrNTtOWh1SKHmee3QLcgQRX4EwQJI
 DPI8WjvJYAPn727pExdd9EK1dN/KeibgwqaO6OWEP+zFxGGVZhAHz8fO6FxqH/ShMERM
 Hg52fCZZTGRtux9s2IdtP5MlbG/Q9P+SarQ9wfzK1O+nuNb2c1ssRQTc/OVnLdq/l37x aw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371u728crb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 14:10:59 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122J2Y1U003611;
 Tue, 2 Mar 2021 19:09:51 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3710sqms21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 19:09:51 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122J9oT729360502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 19:09:50 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82619BE053;
 Tue,  2 Mar 2021 19:09:50 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EF4EBE051;
 Tue,  2 Mar 2021 19:09:49 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.44.137])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 19:09:49 +0000 (GMT)
Subject: Re: [PATCH 40/44] tty: hvc, drop unneeded forward declarations
To: Jiri Slaby <jslaby@suse.cz>, gregkh@linuxfoundation.org
References: <20210302062214.29627-1-jslaby@suse.cz>
 <20210302062214.29627-40-jslaby@suse.cz>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <4f3c0b03-4a1b-3007-97c3-560afe5f9ab4@linux.ibm.com>
Date: Tue, 2 Mar 2021 11:09:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210302062214.29627-40-jslaby@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020144
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/1/21 10:22 PM, Jiri Slaby wrote:
> Forward declarations make the code larger and rewrites harder. Harder as
> they are often omitted from global changes. Remove forward declarations
> which are not really needed, i.e. the definition of the function is
> before its first use.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: linuxppc-dev@lists.ozlabs.org

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

> ---
>  drivers/tty/hvc/hvcs.c | 25 -------------------------
>  1 file changed, 25 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
> index c90848919644..0b89d878a108 100644
> --- a/drivers/tty/hvc/hvcs.c
> +++ b/drivers/tty/hvc/hvcs.c
> @@ -290,36 +290,11 @@ static LIST_HEAD(hvcs_structs);
>  static DEFINE_SPINLOCK(hvcs_structs_lock);
>  static DEFINE_MUTEX(hvcs_init_mutex);
> 
> -static void hvcs_unthrottle(struct tty_struct *tty);
> -static void hvcs_throttle(struct tty_struct *tty);
> -static irqreturn_t hvcs_handle_interrupt(int irq, void *dev_instance);
> -
> -static int hvcs_write(struct tty_struct *tty,
> -		const unsigned char *buf, int count);
> -static int hvcs_write_room(struct tty_struct *tty);
> -static int hvcs_chars_in_buffer(struct tty_struct *tty);
> -
> -static int hvcs_has_pi(struct hvcs_struct *hvcsd);
> -static void hvcs_set_pi(struct hvcs_partner_info *pi,
> -		struct hvcs_struct *hvcsd);
>  static int hvcs_get_pi(struct hvcs_struct *hvcsd);
>  static int hvcs_rescan_devices_list(void);
> 
> -static int hvcs_partner_connect(struct hvcs_struct *hvcsd);
>  static void hvcs_partner_free(struct hvcs_struct *hvcsd);
> 
> -static int hvcs_enable_device(struct hvcs_struct *hvcsd,
> -		uint32_t unit_address, unsigned int irq, struct vio_dev *dev);
> -
> -static int hvcs_open(struct tty_struct *tty, struct file *filp);
> -static void hvcs_close(struct tty_struct *tty, struct file *filp);
> -static void hvcs_hangup(struct tty_struct * tty);
> -
> -static int hvcs_probe(struct vio_dev *dev,
> -		const struct vio_device_id *id);
> -static int hvcs_remove(struct vio_dev *dev);
> -static int __init hvcs_module_init(void);
> -static void __exit hvcs_module_exit(void);
>  static int hvcs_initialize(void);
> 
>  #define HVCS_SCHED_READ	0x00000001
> 

