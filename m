Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4301B96191
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 15:49:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CXGB5cvHzDr6t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 23:49:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="i2+tTh0j"; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CVf61GKxzDqCG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:36:27 +1000 (AEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7KCXVlC110054;
 Tue, 20 Aug 2019 12:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=U0YrPI3YSTApeIb02QsSumjihZw/5Iua1dpqtC5PcIU=;
 b=i2+tTh0jWqm7OuxaMC1WbDDAKzf6wJWO/S9Xrmjuj6K1ZIRXkhk114IpfA/TEVI/aLFp
 UNEqDkA5NycvtLbOt7h0PJL+/oocwkO9HyI/MSs73PqBSVhOmnlYEaBq+qRyD9q/ObDQ
 HPklD67v04ayHBD/N8HhH1F4PARrZ/z56svru9nCOUSoIH5l1TnD7Ky3UYRguoymE74B
 vF8OXpj0XY4ryj/0Mf0KUrfwNtzloKXnchKE1ii8T+oQC5aHVpKZI0gKEbk7FBkhoRLe
 ClWaM8i7Uoousl7U6k2jYWd6StPfkPUtoHyK/wpaFPHSZ8xZg9EhG8SksN0VHLrS4T6b Jw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2ue9hpe04a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:36:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7KCRphH002783;
 Tue, 20 Aug 2019 12:34:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2ug1g96gva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:34:14 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7KCYDVq020906;
 Tue, 20 Aug 2019 12:34:14 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 20 Aug 2019 05:34:13 -0700
Date: Tue, 20 Aug 2019 15:34:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: shilpa.bhat@linux.vnet.ibm.com
Subject: [bug report] hwmon: (ibmpowernv) Add attributes to enable/disable
 sensor groups
Message-ID: <20190820123407.GA10773@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9354
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=836
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908200131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9354
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=899 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908200132
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Shilpasri G Bhat,

The patch e0da99123f3c: "hwmon: (ibmpowernv) Add attributes to
enable/disable sensor groups" from Jul 24, 2018, leads to the
following static checker warning:

	drivers/hwmon/ibmpowernv.c:353 init_sensor_group_data()
	warn: missing error code here? 'sgrp()' failed. 'ret' = '0'

drivers/hwmon/ibmpowernv.c
   334  static int init_sensor_group_data(struct platform_device *pdev,
   335                                    struct platform_data *pdata)
   336  {
   337          struct sensor_group_data *sgrp_data;
   338          struct device_node *groups, *sgrp;
   339          int count = 0, ret = 0;
   340          enum sensors type;
   341  
   342          groups = of_find_compatible_node(NULL, NULL, "ibm,opal-sensor-group");
   343          if (!groups)
   344                  return ret;

To me the intent would be more clear if we said "return 0;".  I look at
that I think maybe it's a bug.

   345  
   346          for_each_child_of_node(groups, sgrp) {
   347                  type = get_sensor_type(sgrp);
   348                  if (type != MAX_SENSOR_TYPE)
   349                          pdata->nr_sensor_groups++;
   350          }
   351  
   352          if (!pdata->nr_sensor_groups)
   353                  goto out;

And here?  Is this still a success path?

   354  
   355          sgrp_data = devm_kcalloc(&pdev->dev, pdata->nr_sensor_groups,
   356                                   sizeof(*sgrp_data), GFP_KERNEL);
   357          if (!sgrp_data) {
   358                  ret = -ENOMEM;
   359                  goto out;
   360          }
   361  
   362          for_each_child_of_node(groups, sgrp) {
   363                  u32 gid;
   364  
   365                  type = get_sensor_type(sgrp);

regards,
dan carpenter
