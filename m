Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E64A6D00
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 09:37:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpZtg3xDNz3cLN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 19:37:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eHDAruSO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eHDAruSO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=kraxel@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=eHDAruSO; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=eHDAruSO; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpZt10kqyz2yfg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 19:37:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643791025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0LxRwlZfMqnWt1iARRSy0LPvgy7cUgzWuLb0lOOyGTo=;
 b=eHDAruSO94XvlanggwbUrogAjkq7UhylOgtMRcFHLxsjMvHgFJWgmgrGOk7TdNR2JSsbih
 LJbrm8/Xj1sWubvTAAJFntSZIcjDt+klgFObgiiyZXX3y7awtBnHAMWQ+yLx7w1DsJtrtQ
 SivHwPQ+OzPwiJ1LwD70sV80+jE3j8Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643791025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0LxRwlZfMqnWt1iARRSy0LPvgy7cUgzWuLb0lOOyGTo=;
 b=eHDAruSO94XvlanggwbUrogAjkq7UhylOgtMRcFHLxsjMvHgFJWgmgrGOk7TdNR2JSsbih
 LJbrm8/Xj1sWubvTAAJFntSZIcjDt+klgFObgiiyZXX3y7awtBnHAMWQ+yLx7w1DsJtrtQ
 SivHwPQ+OzPwiJ1LwD70sV80+jE3j8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-D3Wl-U4bMai7-yURfjTIfw-1; Wed, 02 Feb 2022 03:37:01 -0500
X-MC-Unique: D3Wl-U4bMai7-yURfjTIfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16743839A3F;
 Wed,  2 Feb 2022 08:36:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CB204F86D;
 Wed,  2 Feb 2022 08:36:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 04BD61800397; Wed,  2 Feb 2022 09:36:54 +0100 (CET)
Date: Wed, 2 Feb 2022 09:36:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v7 0/5] Allow guest access to EFI confidential computing
 secret area
Message-ID: <20220202083653.p3cb4w3qdud4e33t@sirius.home.kraxel.org>
References: <20220201124413.1093099-1-dovmurik@linux.ibm.com>
 <Yfk6vEuZFtgtA+G+@kroah.com>
 <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
 <20220202040157.GA8019@srcf.ucam.org> <YfogOurPZb7+Yelo@kroah.com>
 <20220202065443.GA9249@srcf.ucam.org> <YfotMyQiQ66xfCOQ@kroah.com>
 <20220202071023.GA9489@srcf.ucam.org>
 <CAMj1kXFTyc9KnMsnvs+mt80DbJL8VGKKcQ0J=4NrGYGSAG8sRw@mail.gmail.com>
 <20220202080401.GA9861@srcf.ucam.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202080401.GA9861@srcf.ucam.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Brijesh Singh <brijesh.singh@amd.com>, Lenny Szubowicz <lszubowi@redhat.com>,
 gcwilson@linux.ibm.com, Ard Biesheuvel <ardb@kernel.org>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@suse.de>,
 "Serge E. Hallyn" <serge@hallyn.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, dougmill@linux.vnet.ibm.com,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, linux-coco@lists.linux.dev,
 gjoyce@ibm.com, Daniel Axtens <dja@axtens.net>,
 Dave Hansen <dave.hansen@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Andrew Scull <ascull@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  Hi,
 
> The only thing I personally struggle with here is whether "coco" is the 
> best name for it, and whether there are reasonable use cases that 
> wouldn't be directly related to confidential computing (eg, if the 
> firmware on a bare-metal platform had a mechanism for exposing secrets 
> to the OS based on some specific platform security state, it would seem 
> reasonable to expose it via this mechanism but it may not be what we'd 
> normally think of as Confidential Computing).
> 
> But I'd also say that while we only have one implementation currently 
> sending patches, it's fine for the code to live in that implementation 
> and then be abstracted out once we have another.

The implementation can be sorted later when a second implementation
shows up, but it'll be better if we don't have to change the naming
convention.

"coco/efi_secrets" doesn't look like a good choice to me, given that it
is rather likely we see more users for this showing up.

Having a "secrets/" directory looks good to me.  Then the individual
implementations can either add files to the directory, i.e. efi_secrets
would create "secrets/<guid>" files.  Or each implementation creates a
subdirectory with the secrets, i.e. "secrets/coco/" and
"secrets/coco/<guid>".

Longer-term (i.e once we have more than one implementation) we probably
need a separate module which owns and manages the "secrets/" directory,
and possibly provides some common helper functions too.

take care,
  Gerd

