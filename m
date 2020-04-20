Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E871B1373
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 19:47:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495Z0642HGzDqht
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 03:47:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=hQCSXdDp; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQCSXdDp; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495SvX4JxfzDqdv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 23:58:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587391077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pK26z2Uz8J+xMXGm08XY3fCeYfVumTWEKpq3I9uMJ70=;
 b=hQCSXdDpVOG0mefk3CCL4YQ1Cx6SU+9tCQGoFrdEt6Wy8JGpB+t3GJrbO5AwGywm1vI++w
 hR3Z+s3VuUW7AW3fQtN5jPIyG6M5KbugnGSwCYtOndUF2V7nOb9ui/e4EiQTMcV2fFnBz1
 i2M4F6L/9YjaAdLdrqqmaPf0PkT7lRY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587391077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pK26z2Uz8J+xMXGm08XY3fCeYfVumTWEKpq3I9uMJ70=;
 b=hQCSXdDpVOG0mefk3CCL4YQ1Cx6SU+9tCQGoFrdEt6Wy8JGpB+t3GJrbO5AwGywm1vI++w
 hR3Z+s3VuUW7AW3fQtN5jPIyG6M5KbugnGSwCYtOndUF2V7nOb9ui/e4EiQTMcV2fFnBz1
 i2M4F6L/9YjaAdLdrqqmaPf0PkT7lRY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-mEQr_dY9MziBGz2QcAwBYA-1; Mon, 20 Apr 2020 09:57:54 -0400
X-MC-Unique: mEQr_dY9MziBGz2QcAwBYA-1
Received: by mail-wr1-f70.google.com with SMTP id i10so5725042wrq.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 06:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pK26z2Uz8J+xMXGm08XY3fCeYfVumTWEKpq3I9uMJ70=;
 b=OaZNL3loFunJcEiczS5db7dacAK9ME665aStC1iFtUHtmSlhXf5MxRU5LtaRARXixr
 RHO0zJNCaMa94PkvxPd8Yr1+mQ9ns8bemUpmDjumgA0IeEXA2LFtaZoT4d+Tanrg8NmL
 w5N0hfJDcQaLlwpmUC8+5ntkhyd+1OrHVuVM9+qSqFRZ6a9KdV4rMZ38ZTdM5YyePhCj
 8Ipfx+AHqf6G86/RRPPtDIlFgZBpTGOw5PBVH93XFiI5tVNUUqjZwBbkW3gviAO2YNL9
 rgZUYp2YB66TKBmMNl0Y6pShE23FtZ6meZuViX3hXWO0lQjdbh9ojggvHVW3uLBz0oKo
 UWrw==
X-Gm-Message-State: AGi0PuZ8SYYaSf5cY+j8zjgZUInIT5dC9TZ1rKYfOCkiyd9KNF7Jo9EU
 1zHhDsmK7pptBrzVk8Qt+PIpB5mI+8/fSrzf+4jDF3oCVwYdO1LHjdg3JSycJgW6arHPHiklHrY
 ZRljoZEeC3jCeS7MFSNhzXANBKw==
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr16860448wmg.147.1587391073765; 
 Mon, 20 Apr 2020 06:57:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypKZBYixV5ajKWzxEAUUh742/WPOg+S3dMK8bDyvyM4eMw8EIY0hxy1C7QN16yJpeFB4fL8+FQ==
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr16860432wmg.147.1587391073551; 
 Mon, 20 Apr 2020 06:57:53 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.102])
 by smtp.gmail.com with ESMTPSA id l5sm1432890wmi.22.2020.04.20.06.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 06:57:52 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 6/8] simplefs: add file creation functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-7-eesposit@redhat.com>
 <20200414125626.GC720679@kroah.com>
Message-ID: <f371bcc0-266a-cb0b-3bde-fed336b8c9b5@redhat.com>
Date: Mon, 20 Apr 2020 15:57:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414125626.GC720679@kroah.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 21 Apr 2020 03:37:26 +1000
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
Cc: Song Liu <songliubraving@fb.com>, linux-usb@vger.kernel.org,
 bpf@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Hugh Dickins <hughd@google.com>,
 Paul Mackerras <paulus@samba.org>, John Johansen <john.johansen@canonical.com>,
 netdev@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 Christoph Hellwig <hch@lst.de>, Andrew Donnellan <ajd@linux.ibm.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Mark Fasheh <mark@fasheh.com>, Anton Vorontsov <anton@enomsg.org>,
 John Fastabend <john.fastabend@gmail.com>, James Morris <jmorris@namei.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, oprofile-list@lists.sf.net,
 Yonghong Song <yhs@fb.com>, Ian Kent <raven@themaw.net>,
 Andrii Nakryiko <andriin@fb.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-fsdevel@vger.kernel.org,
 "Manoj N. Kumar" <manoj@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 linux-nfs@vger.kernel.org, Iurii Zaikin <yzaikin@google.com>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-mm@kvack.org, linux-s390@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Daniel Vetter <daniel@ffwll.ch>,
 Colin Cross <ccross@android.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Joel Becker <jlbec@evilplan.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/14/20 2:56 PM, Greg Kroah-Hartman wrote:
> On Tue, Apr 14, 2020 at 02:43:00PM +0200, Emanuele Giuseppe Esposito wrote:
>> A bunch of code is duplicated between debugfs and tracefs, unify it to the
>> simplefs library.
>>
>> The code is very similar, except that dentry and inode creation are unified
>> into a single function (unlike start_creating in debugfs and tracefs, which
>> only takes care of dentries).  This adds an output parameter to the creation
>> functions, but pushes all error recovery into fs/simplefs.c.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   fs/simplefs.c            | 150 +++++++++++++++++++++++++++++++++++++++
>>   include/linux/simplefs.h |  19 +++++
>>   2 files changed, 169 insertions(+)
> 
> What's wrong with libfs, isn't that supposed to be for these types of
> "common" filesystem interactions?
> 
> Why create a whole "new" fs for this?

I assume you meant a new file. These new functions are used only by a 
few filesystems, and I didn't want to include them in vmlinux 
unconditionally, so I introduced simplefs.c and CONFIG_SIMPLEFS instead 
of extending libfs.c. In this way only fs that need this code like 
debugfs and tracefs will load it.

Thank you,

Emanuele

