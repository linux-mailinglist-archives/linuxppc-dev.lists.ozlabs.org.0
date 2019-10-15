Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F96D7B17
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 18:21:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t0zb5ltYzDr4L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 03:21:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=darrick.wong@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="GYpHVd54"; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t0xC1ShrzDr2s
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 03:19:10 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9FGE7m4003174;
 Tue, 15 Oct 2019 16:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=RseHhUHVSGnYt/53lXUsPHsqa6HrkkpmijudFUk1PGQ=;
 b=GYpHVd54dUFvc4CzF9J3oaFBSTS/ly2ecg/7l5ZswJQ5TR0e6nuxqZWlPZEFHktnXi8C
 VA3GD+1FU0v1JVSWu70jKuTkS1YIaGWY2TkJvtmwSZJbi+epnqOY5T6Y9pXH41mqhnbG
 CSb6pF48yO5PtAzbSOJ03lqM4WsXL1eLViUrOXq4n7xBL3dPFuZBEhaZxbAvnb/r6L+w
 Jdxan1uWoKbOcvbD+cVApWz7kC2Z19qvZ/Ks8cbDWAI/6u0G0oKhRnT3NPublsmRb9SY
 tcJTVcE7uERN8M+VGQyYP7hO4N8K/2NSePLhM6cjbWSlJfCvGPzbf0FikAainQFbgoFE ww== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2vk7fr92x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Oct 2019 16:19:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9FGIqvB185260;
 Tue, 15 Oct 2019 16:18:59 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2vnf7rgcnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Oct 2019 16:18:59 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9FGID9k012141;
 Tue, 15 Oct 2019 16:18:13 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 15 Oct 2019 16:18:13 +0000
Date: Tue, 15 Oct 2019 09:18:11 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH] xfs: introduce "metasync" api to sync metadata to fsblock
Message-ID: <20191015161811.GE13108@magnolia>
References: <1570977420-3944-1-git-send-email-kernelfans@gmail.com>
 <20191013163417.GQ13108@magnolia> <20191014083315.GA10091@mypc>
 <20191014094311.GD5939@quack2.suse.cz>
 <d3ffa114-8b73-90dc-8ba6-3f44f47135d7@sandeen.net>
 <20191014200303.GF5939@quack2.suse.cz>
 <5796090e-6206-1bd7-174e-58798c9af052@sandeen.net>
 <20191015080102.GB3055@infradead.org>
 <20191015131004.GA7456@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015131004.GA7456@mit.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9411
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910150142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9411
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910150141
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
Cc: linux-xfs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Eric Sandeen <esandeen@redhat.com>, Jan Kara <jack@suse.com>,
 Eric Sandeen <sandeen@sandeen.net>, Pingfan Liu <kernelfans@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Dave Chinner <dchinner@redhat.com>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 15, 2019 at 09:10:04AM -0400, Theodore Y. Ts'o wrote:
> On Tue, Oct 15, 2019 at 01:01:02AM -0700, Christoph Hellwig wrote:
> > On Mon, Oct 14, 2019 at 03:09:48PM -0500, Eric Sandeen wrote:
> > > We're in agreement here.  ;)  I only worry about implementing things like this
> > > which sound like guarantees, but aren't, and end up encouraging bad behavior
> > > or promoting misconceptions.
> > > 
> > > More and more, I think we should reconsider Darrick's "bootfs" (ext2 by another
> > > name, but with extra-sync-iness) proposal...
> > 
> > Having a separate simple file system for the boot loader makes a lot of
> > sense.  Note that vfat of EFI is the best choice, but at least it is
> > something.  SysV Unix from the 90s actually had a special file system just
> > for that, and fs/bfs/ in Linux supports that.  So this isn't really a new
> > thing either.
> 
> Did you mean to say "vfaat of EFI isn't the best choice"?
> 
> If we were going to be doing something like "bootfs", what sort of
> semantics would be sufficient?  Is doing an implied fsync() on every
> close(2) enough, or do we need to do something even more conservative?

I'm assuming you'd also want to make sure the journal checkpoints as
part of fsync, right?  Aside from being an April Fools joke, bootfs[1]
does implement the semantics I needed to fix all the complaining about
grub being broken. 8-)

Granted there's also the systemd bootloader spec[2] which says
FAT{16,32}...

[1] https://lore.kernel.org/linux-fsdevel/20190401070001.GJ1173@magnolia/
[2] https://systemd.io/BOOT_LOADER_SPECIFICATION.html

--D

> 	 	       	       	     - Ted
