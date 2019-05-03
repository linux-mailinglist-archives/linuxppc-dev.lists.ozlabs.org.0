Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF4B1341E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 21:44:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wjJQ6RQRzDqc4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2019 05:44:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="wIguO8/9"; 
 dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wjH32JdszDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2019 05:43:26 +1000 (AEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43JYFkY080867;
 Fri, 3 May 2019 19:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=mvUI0VFBCAvVRNw9d30IZkRyb5+TR5y4/c7lmODIiUI=;
 b=wIguO8/9bDqxYKL1NppYhywn9qXIxdQnf93l36Wq0RTzwt/57hLu8dCfv37sBKCXPeqj
 hxwaF/lETFoZhrcUjErLpo44Dnh7HeZEjY2IVCppAtEMWKrbKnM3ba4GIpx5PfCRguo6
 FuLtqlgKCVriRHixHi8c3HYL+D6lwfUfnT4jJD0jesma9DsVu3PfHb8hR3FZwYG42YcB
 hrl07hJjYEG2fmTi3sNYA0IKrseqyU4WjXV4xom/UZ0NTTUh3nr+4UqvMOPRoVVtr6+f
 OfGQbDM1nsjkl/kHRAqSF5NiHraXDyfZGa3R55IRGMcKGxQ73nsQhKR2oQU5tEVUENom tw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 2s6xhyrusg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 May 2019 19:43:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x43JhFv0012562;
 Fri, 3 May 2019 19:43:19 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2s6xhhj586-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 May 2019 19:43:19 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x43JhCLc030224;
 Fri, 3 May 2019 19:43:13 GMT
Received: from kadam (/196.104.111.181)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 03 May 2019 12:43:12 -0700
Date: Fri, 3 May 2019 22:43:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH] soc: fsl: qe: gpio: Fix an error code in qe_pin_request()
Message-ID: <20190503194300.GG2269@kadam>
References: <20190503131551.GB1236@mwanda>
 <CADRPPNTGovYXL8vo7B6d73xu5BzpZBJLV=sGXK9HXrad-3HMeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADRPPNTGovYXL8vo7B6d73xu5BzpZBJLV=sGXK9HXrad-3HMeg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=862
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905030129
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9245
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=879 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905030128
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 kernel-janitors@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 03, 2019 at 01:45:07PM -0500, Li Yang wrote:
> On Fri, May 3, 2019 at 8:19 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > There was a missing error code in this path.  It meant that we returned
> > ERR_PTR(0) which is NULL and would result in a NULL dereference in the
> > caller.
> 
> Thanks Dan.  An early version of this patch has been included in a
> pending pull request to arm-soc.
> https://lkml.org/lkml/2019/5/1/506

Oops.  Sorry, I switched computers and forgot to copy my old outbox
over.  :(

regards,
dan carpenter

