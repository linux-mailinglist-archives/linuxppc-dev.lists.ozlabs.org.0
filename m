Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0519E1B138A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 19:50:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495Z474QjqzDqrC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 03:50:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=fezp4Ucn; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fezp4Ucn; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495Svm0NjrzDqr6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 23:58:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587391089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xUgf1dELTVkqbl5oz8lk6XQ7zC/RuDwFip+M0efFdJc=;
 b=fezp4UcnLOiAwNGjQ4oX63tLk2wtJmc/lUJKIWGuww8wBoQy59I5YcvzlgWs1QRTxJYK4L
 RQi1qkuIPQoJ4PdOTCK+AJWtDrq5bEV0WD1kszf0CVst92cloFucf3d7ZUIrV2+mqyk8V6
 +m8tv/U8+XhXPaBJg1pmKBZc/SDKS44=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587391089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xUgf1dELTVkqbl5oz8lk6XQ7zC/RuDwFip+M0efFdJc=;
 b=fezp4UcnLOiAwNGjQ4oX63tLk2wtJmc/lUJKIWGuww8wBoQy59I5YcvzlgWs1QRTxJYK4L
 RQi1qkuIPQoJ4PdOTCK+AJWtDrq5bEV0WD1kszf0CVst92cloFucf3d7ZUIrV2+mqyk8V6
 +m8tv/U8+XhXPaBJg1pmKBZc/SDKS44=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-ffUulalINSqdC4bZdzJpAQ-1; Mon, 20 Apr 2020 09:58:07 -0400
X-MC-Unique: ffUulalINSqdC4bZdzJpAQ-1
Received: by mail-wr1-f70.google.com with SMTP id i10so5725353wrq.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 06:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xUgf1dELTVkqbl5oz8lk6XQ7zC/RuDwFip+M0efFdJc=;
 b=ZrRottqd8zqLPhjl8c4fe+m7fe6OJRj2C5SsRNyxXnX379x+oTC6upDRL1MmAGIoyK
 2Omz7tnqM8YtH9WU+bgk3ZotOXhB1KLxQUeNSR5XMq0CadNDjuc/ymDKNmViCXLQnFoJ
 C5A3rUAOeEb31SFo4Gmhjl9XTDNkW2P8qgosTX6oM/EN+LSNXHKj6hxiSWVv27RHZE5b
 eaYw/KuhixLSJqo2ImrfKaFjl1Fwe68zEK9ZX0QtAGw7W6JTxj1rrYEnt84VuFcG0IAG
 dXnc72eewg9G+/YBcmfl/gn9VsD3g08YhSeBveNRbK03hJRCbMyc+VIBNqcejFD+RRZL
 w5sw==
X-Gm-Message-State: AGi0PubKkiAswIuC+gwE8JTC4nJpDh1lK6mFciw/jyuiSgfQHbjCDVU2
 k3VG4R5U3NGYH3Jdnxfn8yfEqEl2Fsw5NKWzdELAdZOfxKwoNkK+tSdepDwzd1OzBJ5JfBZ0ZCZ
 BJVdRs29VicC5SYtAx2yctLgzBw==
X-Received: by 2002:adf:f343:: with SMTP id e3mr18182952wrp.51.1587391086584; 
 Mon, 20 Apr 2020 06:58:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypKgfh4+u4HEj4PPYW/XSZ46PCQmhZFzPWrmjnxffDGdhSBfk7/303BzRADycOzBMc3ansohTA==
X-Received: by 2002:adf:f343:: with SMTP id e3mr18182928wrp.51.1587391086383; 
 Mon, 20 Apr 2020 06:58:06 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.102])
 by smtp.gmail.com with ESMTPSA id y18sm1584636wmc.45.2020.04.20.06.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 06:58:05 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 4/8] fs: introduce simple_new_inode
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-5-eesposit@redhat.com>
 <20200414130140.GD720679@kroah.com>
Message-ID: <e87e032e-32cf-a6fc-af8f-3bcece2fcff7@redhat.com>
Date: Mon, 20 Apr 2020 15:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414130140.GD720679@kroah.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 21 Apr 2020 03:37:28 +1000
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



On 4/14/20 3:01 PM, Greg Kroah-Hartman wrote:
> On Tue, Apr 14, 2020 at 02:42:58PM +0200, Emanuele Giuseppe Esposito wrote:
>> It is a common special case for new_inode to initialize the
>> time to the current time and the inode to get_next_ino().
>> Introduce a core function that does it and use it throughout
>> Linux.
> 
> Shouldn't this just be called new_inode_current_time()?
> 
> How is anyone going to remember what simple_new_inode() does to the
> inode structure?

I noticed that most functions in libfs.c are called "simple_*" when they 
do the right thing for the majority of simple use cases (e.g., 
simple_symlink_inode_operations or simple_dir_operations). I can 
certainly rename the function.

Thank you for all the feedback, I will incorporate it and send a new 
patch series soon.


Emanuele
> 
>> --- a/fs/libfs.c
>> +++ b/fs/libfs.c
>> @@ -595,6 +595,18 @@ int simple_write_end(struct file *file, struct address_space *mapping,
>>   }
>>   EXPORT_SYMBOL(simple_write_end);
>>   
>> +struct inode *simple_new_inode(struct super_block *sb)
>> +{
>> +	struct inode *inode = new_inode(sb);
>> +	if (inode) {
>> +		inode->i_ino = get_next_ino();
>> +		inode->i_atime = inode->i_mtime =
>> +			inode->i_ctime = current_time(inode);
>> +	}
>> +	return inode;
>> +}
>> +EXPORT_SYMBOL(simple_new_inode);

