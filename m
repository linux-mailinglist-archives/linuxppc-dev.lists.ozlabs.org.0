Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2F11B258B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 14:07:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4962P70kTGzDqjp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 22:07:07 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=bztazM9d; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bztazM9d; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4961Vl6VJSzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 21:26:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587468413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wz4VbvB++wEfRs6vgYsKShIscVlUFGxxa9BcmRhqVZE=;
 b=bztazM9d7Ve3/nqCTE1J3qFDkuKV1zj5R+2Ut9MvPnPQtfTbyEdQijk/vRmCb4ka4/FQlz
 4dYuRfyU3H1z6L8PjMpk7U/SQVGwhR09h6Ol0gQuhkisiQxTCOiwDfOLduBTOk6DSEWKXi
 /ACK1PITnxToKTllyeT0whrmMkiKBso=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587468413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wz4VbvB++wEfRs6vgYsKShIscVlUFGxxa9BcmRhqVZE=;
 b=bztazM9d7Ve3/nqCTE1J3qFDkuKV1zj5R+2Ut9MvPnPQtfTbyEdQijk/vRmCb4ka4/FQlz
 4dYuRfyU3H1z6L8PjMpk7U/SQVGwhR09h6Ol0gQuhkisiQxTCOiwDfOLduBTOk6DSEWKXi
 /ACK1PITnxToKTllyeT0whrmMkiKBso=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-GfXKKgfeMtKrNnCXMz-17Q-1; Tue, 21 Apr 2020 07:26:49 -0400
X-MC-Unique: GfXKKgfeMtKrNnCXMz-17Q-1
Received: by mail-wr1-f72.google.com with SMTP id 11so7364217wrc.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 04:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rdnJwtlpirvD/9L7xBhvp5m2pmFh+za9be9mrI0LQDE=;
 b=qkfD/Lzy3khs4r3BOwoDiBsbSqjOGseVVtR0Sn4RHJosa3S6gCaH4PngspgujaiPGE
 NKW/WBlxw6/IWoAHEfqOUe4LrSl6PWY8dt6T8zZ8PGcPxA8FBHA9jmSK6ajdDpJ4wF1T
 3WNUaqfurUaq9/fTcwsAhqyWyfl4aUPn2Xhk+NxFY3uqMSj61HC85kvmyp5lzkA07nDB
 FHy5UHTUMcCqAGZlxqvO2hPydikrUVf9r3HxM44BmlFJVUIULEwj4jnLao+6tYe/nqVu
 kNxayefTtn6UphXVoGZ2P/WY5jcGNTpHKOhv/6i26fm5Yvvb02zMd3y58zNklMdNSYeu
 36HQ==
X-Gm-Message-State: AGi0PuZk9DV+Esa9uDlDRpVaGSlDYzA7Ykc5gqaDxri/8oZA3DBGNMof
 UjsnoQo5tBcnwdoLT7seYGShO1T4ZWmpdPIRBJgE8I4/5oYtKJVHX9uhWwkj9xbrkCcbYKpe8c5
 2Oqre/IsvtkQU23Zegu1dvTFvwA==
X-Received: by 2002:adf:9d8b:: with SMTP id p11mr19729416wre.322.1587468408408; 
 Tue, 21 Apr 2020 04:26:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypLFuKY9/+ahvd0H1GaLlnzWhUfHQUCFYS4RPKLURvSUVIanlHjWMhAT2wQvuycrqclvo4/jpg==
X-Received: by 2002:adf:9d8b:: with SMTP id p11mr19729360wre.322.1587468408223; 
 Tue, 21 Apr 2020 04:26:48 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id z15sm3213949wrs.47.2020.04.21.04.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 04:26:47 -0700 (PDT)
Subject: Re: [PATCH 2/8] fs: extract simple_pin/release_fs to separate files
To: Frederic Barrat <fbarrat@linux.ibm.com>, linux-nfs@vger.kernel.org
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-3-eesposit@redhat.com>
 <7abfdd3b-dbbe-52ab-df53-95e9f86d39cd@linux.ibm.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <0d33b363-3801-8147-6f49-f1d6a845fdaf@redhat.com>
Date: Tue, 21 Apr 2020 13:26:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7abfdd3b-dbbe-52ab-df53-95e9f86d39cd@linux.ibm.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 21 Apr 2020 22:03:05 +1000
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
 Doug Ledford <dledford@redhat.com>, oprofile-list@lists.sf.net,
 Yonghong Song <yhs@fb.com>, Ian Kent <raven@themaw.net>,
 Andrii Nakryiko <andriin@fb.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Uma Krishnan <ukrishn@linux.ibm.com>, Maxime Ripard <mripard@kernel.org>,
 "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Iurii Zaikin <yzaikin@google.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Daniel Vetter <daniel@ffwll.ch>,
 Colin Cross <ccross@android.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, ocfs2-devel@oss.oracle.com,
 Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/21/20 1:19 PM, Frederic Barrat wrote:
>=20
>=20
>> diff --git a/drivers/misc/cxl/Kconfig b/drivers/misc/cxl/Kconfig
>> index 39eec9031487..a62795079d9c 100644
>> --- a/drivers/misc/cxl/Kconfig
>> +++ b/drivers/misc/cxl/Kconfig
>> @@ -19,6 +19,7 @@ config CXL
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select CXL_BASE
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select CXL_AFU_DRIVER_OPS
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select CXL_LIB
>> +=C2=A0=C2=A0=C2=A0 select SIMPLEFS
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default m
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Select this option to enable =
driver support for IBM Coherent
>> diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
>> index b493de962153..0b8f8de7475a 100644
>> --- a/drivers/misc/cxl/api.c
>> +++ b/drivers/misc/cxl/api.c
>> @@ -9,6 +9,7 @@
>> =C2=A0 #include <misc/cxl.h>
>> =C2=A0 #include <linux/module.h>
>> =C2=A0 #include <linux/mount.h>
>> +#include <linux/simplefs.h>
>> =C2=A0 #include <linux/pseudo_fs.h>
>> =C2=A0 #include <linux/sched/mm.h>
>> =C2=A0 #include <linux/mmu_context.h>
>> diff --git a/drivers/misc/ocxl/Kconfig b/drivers/misc/ocxl/Kconfig
>> index 2d2266c1439e..ddd9245fff3d 100644
>> --- a/drivers/misc/ocxl/Kconfig
>> +++ b/drivers/misc/ocxl/Kconfig
>> @@ -12,6 +12,7 @@ config OCXL
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on PPC_POWERNV && PCI && EEH
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select OCXL_BASE
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select HOTPLUG_PCI_POWERNV
>> +=C2=A0=C2=A0=C2=A0 select SIMPLEFS
>=20
>=20
> It's not clear to me the Kconfig updated is needed for the ocxl driver.=
=20
> I think it's only needed for the cxl driver.

I am going to get rid of the separate simplefs.c file and related=20
Kconfig entry and put everything in fs/libfs.c, so this file (together=20
with many others touched in this patch) won't be modified in v2.

Thanks,

Emanuele

