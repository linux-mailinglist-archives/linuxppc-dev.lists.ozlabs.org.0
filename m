Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A7205732
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 18:29:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rsDL5pshzDqS2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 02:29:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rs5j345JzDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 02:23:14 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NG2qFP130485; Tue, 23 Jun 2020 12:23:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ukmabddy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 12:23:09 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05NG3MKn133308;
 Tue, 23 Jun 2020 12:23:09 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ukmabdc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 12:23:08 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05NGCPF8006467;
 Tue, 23 Jun 2020 16:23:06 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 31uk4f81yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 16:23:06 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05NGLi0N62259668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jun 2020 16:21:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 666E752051;
 Tue, 23 Jun 2020 16:23:03 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id D39D85204F;
 Tue, 23 Jun 2020 16:23:01 +0000 (GMT)
Date: Tue, 23 Jun 2020 21:53:01 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH 03/18] powerpc/numa: remove ability to enable topology
 updates
Message-ID: <20200623162301.GA24019@linux.vnet.ibm.com>
References: <20200612051238.1007764-1-nathanl@linux.ibm.com>
 <20200612051238.1007764-4-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200612051238.1007764-4-nathanl@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_07:2020-06-23,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1011 mlxlogscore=999 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006120000 definitions=main-2006230119
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: tyreld@linux.ibm.com, ego@linux.vnet.ibm.com, npiggin@gmail.com,
 svaidy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nathan Lynch <nathanl@linux.ibm.com> [2020-06-12 00:12:23]:

> Remove the /proc/powerpc/topology_updates interface and the
> topology_updates=on/off command line argument. The internal
> topology_updates_enabled flag remains for now, but always false.
> 

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 71 +-----------------------------------------
>  1 file changed, 1 insertion(+), 70 deletions(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 9fcf2d195830..34d95de77bdd 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -984,27 +984,7 @@ static int __init early_numa(char *p)
>  }
>  early_param("numa", early_numa);
> 
> -/*
> - * The platform can inform us through one of several mechanisms
> - * (post-migration device tree updates, PRRN or VPHN) that the NUMA
> - * assignment of a resource has changed. This controls whether we act
> - * on that. Disabled by default.
> - */
> -static bool topology_updates_enabled;
> -
> -static int __init early_topology_updates(char *p)
> -{
> -	if (!p)
> -		return 0;
> -
> -	if (!strcmp(p, "on")) {
> -		pr_warn("Caution: enabling topology updates\n");
> -		topology_updates_enabled = true;
> -	}
> -
> -	return 0;
> -}
> -early_param("topology_updates", early_topology_updates);
> +static const bool topology_updates_enabled;
> 
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  /*
> @@ -1632,52 +1612,6 @@ int prrn_is_enabled(void)
>  	return prrn_enabled;
>  }
> 
> -static int topology_read(struct seq_file *file, void *v)
> -{
> -	if (vphn_enabled || prrn_enabled)
> -		seq_puts(file, "on\n");
> -	else
> -		seq_puts(file, "off\n");
> -
> -	return 0;
> -}
> -
> -static int topology_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, topology_read, NULL);
> -}
> -
> -static ssize_t topology_write(struct file *file, const char __user *buf,
> -			      size_t count, loff_t *off)
> -{
> -	char kbuf[4]; /* "on" or "off" plus null. */
> -	int read_len;
> -
> -	read_len = count < 3 ? count : 3;
> -	if (copy_from_user(kbuf, buf, read_len))
> -		return -EINVAL;
> -
> -	kbuf[read_len] = '\0';
> -
> -	if (!strncmp(kbuf, "on", 2)) {
> -		topology_updates_enabled = true;
> -		start_topology_update();
> -	} else if (!strncmp(kbuf, "off", 3)) {
> -		stop_topology_update();
> -		topology_updates_enabled = false;
> -	} else
> -		return -EINVAL;
> -
> -	return count;
> -}
> -
> -static const struct proc_ops topology_proc_ops = {
> -	.proc_read	= seq_read,
> -	.proc_write	= topology_write,
> -	.proc_open	= topology_open,
> -	.proc_release	= single_release,
> -};
> -
>  static int topology_update_init(void)
>  {
>  	start_topology_update();
> @@ -1685,9 +1619,6 @@ static int topology_update_init(void)
>  	if (vphn_enabled)
>  		topology_schedule_update();
> 
> -	if (!proc_create("powerpc/topology_updates", 0644, NULL, &topology_proc_ops))
> -		return -ENOMEM;
> -
>  	topology_inited = 1;
>  	return 0;
>  }
> -- 
> 2.25.4
> 

-- 
Thanks and Regards
Srikar Dronamraju
