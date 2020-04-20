Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 931BB1B13B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 19:58:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495ZDS6txwzDqt3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 03:58:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=HIpqY6r4; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=HIpqY6r4; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495SzQ1MjkzDqdk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 00:01:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587391279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CRCdhBzjtov7RvcoLcOwUA5fYrO6qOb+mWbouXaiL5k=;
 b=HIpqY6r43kH/FzbD5R1+A5UZ+BgK28llVnveeeHeX2tXhDuGWJahaxx8nE2jQ2HscVo06u
 eFPiqlfnbb0CMKbCBPkbuNjRXAIT4KcPj7Y/j+AmBsOhu9xafYxZricmItF0y6lnUPKnjm
 b3rTskufbbHZHwOURsKs14cZW4bJhQI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587391279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CRCdhBzjtov7RvcoLcOwUA5fYrO6qOb+mWbouXaiL5k=;
 b=HIpqY6r43kH/FzbD5R1+A5UZ+BgK28llVnveeeHeX2tXhDuGWJahaxx8nE2jQ2HscVo06u
 eFPiqlfnbb0CMKbCBPkbuNjRXAIT4KcPj7Y/j+AmBsOhu9xafYxZricmItF0y6lnUPKnjm
 b3rTskufbbHZHwOURsKs14cZW4bJhQI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-kh6aG5ngOK-SR_TMaSQK1A-1; Mon, 20 Apr 2020 10:01:16 -0400
X-MC-Unique: kh6aG5ngOK-SR_TMaSQK1A-1
Received: by mail-wm1-f71.google.com with SMTP id h22so4201341wml.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 07:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CRCdhBzjtov7RvcoLcOwUA5fYrO6qOb+mWbouXaiL5k=;
 b=EV5etKKTtywKndlGK7aA/JsdbhXNler4N4BdaDwftnt8mH/yFxmRAsd+yYkriyBE5j
 hfVTsoySAHbYgH1eO8QXYMlXKAqJCtxpbN8tTSdD0nVBVblDRgDs19imN5hcUTPqzjId
 uy3xcFQE+GdL2DeZSXG/ciWA8/s1Emm1xxP52LFvMMBT2qBwYYiJh+eu1ejD2Fg+mQsi
 0pOls8NuVdQuGuu2zJgQfXGSPMBkktg0Xw8g2vzxOCEkx1j5cbVYThfZVRYm3KUjUak9
 EkxuSAnlS6hfdCVnXPpkchHJoFqcIJo64tgCCUmCiJJVNpZ3On6gxfRBC3lf96Z5Z+KK
 NBOQ==
X-Gm-Message-State: AGi0PubSWlQSmD4GQLHDtlrmnpfSVUkCgxZJ+aN+Ffd1MhfdoRmZIkjH
 +Es7ztBjjPvF64RSMySZ14uyCOOK9r9XF7SjjAXo6JNU0/t8bOTJgZfCvAhuDeRUwn1YQTAA+ov
 Q52/UhtGhozw8zI4wrndqHL8kdQ==
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr20314204wrl.201.1587391274309; 
 Mon, 20 Apr 2020 07:01:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypKPnHC5LPyU8TDLr76kncprhTGb3bGNWjc4FM2HGpGEeoX6O6gIYtgQcBPwl5xg+T4TCSCY0A==
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr20314132wrl.201.1587391274111; 
 Mon, 20 Apr 2020 07:01:14 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.102])
 by smtp.gmail.com with ESMTPSA id q17sm1265501wmj.45.2020.04.20.07.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 07:01:13 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 0/8] Simplefs: group and simplify linux fs code
To: Luis Chamberlain <mcgrof@kernel.org>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200416065922.GS11244@42.do-not-panic.com>
Message-ID: <79e3dd06-7cea-7798-42a2-596c185abd7b@redhat.com>
Date: Mon, 20 Apr 2020 16:01:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416065922.GS11244@42.do-not-panic.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 21 Apr 2020 03:37:31 +1000
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
 netdev@vger.kernel.org, linux-s390@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Andrew Donnellan <ajd@linux.ibm.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Mark Fasheh <mark@fasheh.com>, Anton Vorontsov <anton@enomsg.org>,
 John Fastabend <john.fastabend@gmail.com>, James Morris <jmorris@namei.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Yonghong Song <yhs@fb.com>,
 Ian Kent <raven@themaw.net>, Andrii Nakryiko <andriin@fb.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Robert Richter <rric@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 autofs@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-fsdevel@vger.kernel.org,
 "Manoj N. Kumar" <manoj@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 linux-nfs@vger.kernel.org, Iurii Zaikin <yzaikin@google.com>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Daniel Vetter <daniel@ffwll.ch>,
 Colin Cross <ccross@android.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Joel Becker <jlbec@evilplan.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/16/20 8:59 AM, Luis Chamberlain wrote:
> On Tue, Apr 14, 2020 at 02:42:54PM +0200, Emanuele Giuseppe Esposito wrote:
>> This series of patches introduce wrappers for functions,
>> arguments simplification in functions calls and most importantly
>> groups duplicated code in a single header, simplefs, to avoid redundancy
>> in the linux fs, especially debugfs and tracefs.
> 
> The general goal seems worthy, but here I don't see explained why hasn't
> this gone through libfs, and what the intention was long term. For
> instance, you added some other generalizations which you have found. It
> was not clear that this was the goal here, to expand on these paths.
> 
> What if common code on fs is found which are not part of debugfs and
> tracefs, how does one decide if to move to libfs or simplefs?

The idea of simplefs (that I will also explain better in the cover 
letter and commit messages) is that not only it groups common code, but 
also introduces a new struct simple_fs that simplifies parameter 
passing. This means all fs that use these functions and the struct 
should include linux/simplefs.h, while all common functions that take a 
simple_fs struct will be added in simplefs.c

Thank you for all the feedback, I will incorporate it and send a new 
patch series soon.

Emanuele

