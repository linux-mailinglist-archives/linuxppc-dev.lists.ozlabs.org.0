Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5948F1B13ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 20:06:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495ZQb3tlHzDqtd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 04:06:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZOywSWr1; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZOywSWr1; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495TjN0QlGzDqYb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 00:34:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587393253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BICmOxm1sDjBE0Fw16pReYLCBtQ7NAWk0hypsbt5YE=;
 b=ZOywSWr14gk+8Ffl2h37HhuXqUVXYAqhbWrZPLNSPVGPDHG+t2W0wX5imCXn4T2sdv+SiL
 sUnGdYZ/B/3mNIbW1EJfjJhunZuNrr4ouVWFZxwF+bqYVngRYg6Q6GM/K23THaOkBlHiru
 VbMaY4m2Ow4XLm3AJ2QxDvWJJ0+uLR0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587393253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BICmOxm1sDjBE0Fw16pReYLCBtQ7NAWk0hypsbt5YE=;
 b=ZOywSWr14gk+8Ffl2h37HhuXqUVXYAqhbWrZPLNSPVGPDHG+t2W0wX5imCXn4T2sdv+SiL
 sUnGdYZ/B/3mNIbW1EJfjJhunZuNrr4ouVWFZxwF+bqYVngRYg6Q6GM/K23THaOkBlHiru
 VbMaY4m2Ow4XLm3AJ2QxDvWJJ0+uLR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-uLt8BeTVOv-94d3DwdwwoA-1; Mon, 20 Apr 2020 10:34:11 -0400
X-MC-Unique: uLt8BeTVOv-94d3DwdwwoA-1
Received: by mail-wm1-f72.google.com with SMTP id j5so4242791wmi.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 07:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/BICmOxm1sDjBE0Fw16pReYLCBtQ7NAWk0hypsbt5YE=;
 b=CmKZ7S1AsWgpQGM18AjaSJL2MDW0IfWC07MCl2gEwH7neDDvZp7DrZQqsy5rwyDja+
 KWO+09TgdmwxI77E7bFfgemdajaCUwFemdVMQQYQ5HOaDESg1ty3Du2GKMsJ02Ge8Dft
 ziqKTWNePuUHMZ/4RZ/ebQSHAeBvJywhW1xDdRctFe8KjnSwmyyMpxTezrdvtx9uiz5L
 2X6ZzSRlqvJ1yjmI6it+xEdXYI5xE1b+AE0g/sn0m1wLkbHD66Tp4nx9B2xXyXUZsRFd
 az/WWAitDAv+P+E75ikffuOXSWjIdiLcYCquQsA96m05i3g5QhMWbe9tRZ9MW43FirXT
 WGkg==
X-Gm-Message-State: AGi0PuaGbVC77lo9OOJfGg1+umcOUu/YqHwOqDcfdAwv6/ps9/i7HV7A
 EBrpxsmk8Mnwart7NQzj9YXv6Y5OTaIqXgntGk8S9227M2z4vUI7n8MIv9lEakK2NhQwN+tSi1t
 aLBeFaDveAouHY74ybBbQcTt0hQ==
X-Received: by 2002:a5d:6689:: with SMTP id l9mr10607587wru.261.1587393190518; 
 Mon, 20 Apr 2020 07:33:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypIE3DMH5xFDwGNUfVPw+X70x/SDiUNUfiLWd0azjzp9qQ2tZy+YP/738/NNIg43An+9cygOww==
X-Received: by 2002:a5d:6689:: with SMTP id l9mr10607487wru.261.1587393190204; 
 Mon, 20 Apr 2020 07:33:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:199a:e5ab:a38c:544c?
 ([2001:b07:6468:f312:199a:e5ab:a38c:544c])
 by smtp.gmail.com with ESMTPSA id l5sm1432000wrm.66.2020.04.20.07.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 07:33:09 -0700 (PDT)
Subject: Re: [PATCH 6/8] simplefs: add file creation functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-7-eesposit@redhat.com>
 <20200414125626.GC720679@kroah.com>
 <f371bcc0-266a-cb0b-3bde-fed336b8c9b5@redhat.com>
 <20200420142842.GA4125486@kroah.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7d7a9ccc-022d-f60d-d28a-f063ab9494bc@redhat.com>
Date: Mon, 20 Apr 2020 16:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420142842.GA4125486@kroah.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 21 Apr 2020 03:37:32 +1000
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
 Daniel Vetter <daniel@ffwll.ch>, Vasily Gorbik <gor@linux.ibm.com>,
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
 Jeremy Kerr <jk@ozlabs.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Cross <ccross@android.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Joel Becker <jlbec@evilplan.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/04/20 16:28, Greg Kroah-Hartman wrote:
>> I assume you meant a new file. These new functions are used only by a few
>> filesystems, and I didn't want to include them in vmlinux unconditionally,
>> so I introduced simplefs.c and CONFIG_SIMPLEFS instead of extending libfs.c.
>> In this way only fs that need this code like debugfs and tracefs will load
>> it.
> Nothing "loads it", why not just make these libfs functions instead?  As
> the difference between the two is not obvious at all, please don't make
> things confusing.

I think Emanuele meant "will link it" not "will load it".

Emanuele, you can just move everything to libfs.c and get rid of
CONFIG_SIMPLEFS too.  "Do less" is not an offer you want to turn down!

Thanks,

Paolo

