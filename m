Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3523116818
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 09:28:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WbtY21QjzDqRM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 19:28:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jstancek@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="JhhP0HRp"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wbrt6w3SzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 19:26:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575880008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuQftgKLhIdfbe43m9PaVlygiTsJJ2gGUjVhGbD1VTM=;
 b=JhhP0HRpLHb/+ubPnNwToEoILbSOQ+xFAH3VHp0BZzz8f+Mup4pWRFDTFRczBreZ96g33y
 OirWuUwBZoDDWtjRB3bOQ+cQ1Yj5x9roZTQBUz3eYm7PFy+cltdObbsA+Rh4S1kLw5VOy8
 RPEfFPdLwkS4kEUHpLCGGgRNmphmnZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-LYEmGze7OVu4X7zepRIt7g-1; Mon, 09 Dec 2019 03:26:41 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A580C801E7A;
 Mon,  9 Dec 2019 08:26:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69C1C60BE1;
 Mon,  9 Dec 2019 08:26:39 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC9DA18089C8;
 Mon,  9 Dec 2019 08:26:38 +0000 (UTC)
Date: Mon, 9 Dec 2019 03:26:38 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: dftxbs3e <dftxbs3e@free.fr>
Message-ID: <35957501.15762152.1575879998305.JavaMail.zimbra@redhat.com>
In-Reply-To: <f874ea14-becc-9c4b-2f2f-351573e6a751@sandeen.net>
References: <9c0af967-4916-4e8b-e77f-087515793d77@free.fr>
 <e9a171cc-6827-5c43-092a-9dcd8a997b5a@free.fr>
 <f874ea14-becc-9c4b-2f2f-351573e6a751@sandeen.net>
Subject: Re: [bug] userspace hitting sporadic SIGBUS on xfs (Power9,
 ppc64le), v4.19 and later
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.30]
Thread-Topic: userspace hitting sporadic SIGBUS on xfs (Power9, ppc64le),
 v4.19 and later
Thread-Index: Dxe2axPz7lr/TlY+65kmscNpeXn5Kw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: LYEmGze7OVu4X7zepRIt7g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Cc: hch@infradead.org, darrick wong <darrick.wong@oracle.com>,
 Memory Management <mm-qe@redhat.com>, Eric Sandeen <sandeen@sandeen.net>,
 linux-xfs@vger.kernel.org, CKI Project <cki-project@redhat.com>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 LTP Mailing List <ltp@lists.linux.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


----- Original Message -----
> 
> 
> On 12/6/19 6:09 PM, dftxbs3e wrote:
> > Hello!
> > 
> > I am very happy that someone has found this issue.
> > 
> > I have been suffering from rather random SIGBUS errors in similar
> > conditions described by the author.
> > 
> > I don't have much troubleshooting information to provide, however, I hit
> > the issue regularly so I could investigate during that.
> > 
> > How do you debug such an issue? I tried a debugger etc. but besides
> > crashing with SIGBUS, I couldnt get any other meaningful information.

If it's same issue, you could check if dropping caches helps.
Figure out what page is it with crash or systemtap and look at page->flags
and ((struct iomap_page *)page->private)->uptodate bitmap.

> 
> You may want to test the patch Christoph sent on the original thread for
> this issue.

Or v5.5-rc1, Christoph's patch has been merged:
  1cea335d1db1 ("iomap: fix sub-page uptodate handling")

