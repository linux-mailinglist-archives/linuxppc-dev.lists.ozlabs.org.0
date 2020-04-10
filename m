Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B95651A4A69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 21:28:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zSjb02GzzDrHg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 05:28:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=peterx@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GcfgONn4; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zSgw22x9zDqkL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 05:27:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586546822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=egTRqYjBdzetC6Rav2slWK+++8cSaJtQCNbovjaGoc8=;
 b=GcfgONn4XaHWe5LZKohORDPRkoly8L0FK9eLsVPvVPvXOwI961gPynIlhjo7dV5hfVE5qV
 yZcoN/6b09F22GU5Ttbby0oh6U2jAlvqzUbCpZAMKpIrInsidH1achRW0bTEvoIVeMo5go
 1EjvCmgF0/Ga6xmL/EUpmc6HYi5gCFI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-lZYCAmHiPEysqNU92gVoeA-1; Fri, 10 Apr 2020 15:27:01 -0400
X-MC-Unique: lZYCAmHiPEysqNU92gVoeA-1
Received: by mail-qt1-f199.google.com with SMTP id q43so1253900qtj.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 12:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ddNmEkCT3NuYAPr19Gh+8RyFM7t2I+OUmUTTKHVjsXQ=;
 b=qG+Iuvjndr9+a90ESaCaxaUzb4lC65nXFKIX9CqCLmDxShUOPUapqscMJsFyBGqSrC
 7xcwPyGRIYEFoTMW4H2Rg44/LR+3HS1iJDKyuH/1cMkKznEl4ZyqK6UBEZIT/pnTQ2G0
 G+O/LpgLJZhRYttz//qQpC1IWJkVg2BD0ByvqyqvHJx9WNrCLKS+YzFN5GutmpdBzGrX
 AKsdMnmd7ZL6wMV4Mw2Q2sAvURezoTMkVN6VwYo0T0LZZe16Y7Q7Mk5M6C/SiaD15dJw
 dDbk9QSCSv62VUdGi5Ap4p3Q/M8+FR28X7E2VfPFRRFqC6WhlmdngFqB+TA+2phJYzw3
 B4Ng==
X-Gm-Message-State: AGi0PuZTReyhvT1go495IcHpO/X7bQ8zmbc33QuV1yujIqQzc2Crbxzf
 8xxBu4e/encyrQrW1cLrptChEu8HQRdo9n2HaOjpcvSTH5IwxM36vI9UBlXC50p3/u4b7xmk5ck
 oRr5Bt9n/Sd9DlhsVMUos+T/Ymw==
X-Received: by 2002:ac8:2c66:: with SMTP id e35mr769589qta.188.1586546820314; 
 Fri, 10 Apr 2020 12:27:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypJUBND9mw4a79BsRjlZQBzcyo9K+K4n4uLp4F1mRayVM5WnYx0Zu2cY7436wozu46yjuIupKQ==
X-Received: by 2002:ac8:2c66:: with SMTP id e35mr769568qta.188.1586546820098; 
 Fri, 10 Apr 2020 12:27:00 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id o33sm2321940qtj.62.2020.04.10.12.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 12:26:59 -0700 (PDT)
Date: Fri, 10 Apr 2020 15:26:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v2 2/4] hugetlbfs: move hugepagesz= parsing to arch
 independent code
Message-ID: <20200410192656.GE3172@xz-x1>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
 <20200401183819.20647-3-mike.kravetz@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20200401183819.20647-3-mike.kravetz@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mina Almasry <almasrymina@google.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 01, 2020 at 11:38:17AM -0700, Mike Kravetz wrote:
> Now that architectures provide arch_hugetlb_valid_size(), parsing
> of "hugepagesz=3D" can be done in architecture independent code.
> Create a single routine to handle hugepagesz=3D parsing and remove
> all arch specific routines.  We can also remove the interface
> hugetlb_bad_size() as this is no longer used outside arch independent
> code.
>=20
> This also provides consistent behavior of hugetlbfs command line
> options.  The hugepagesz=3D option should only be specified once for
> a specific size, but some architectures allow multiple instances.
> This appears to be more of an oversight when code was added by some
> architectures to set up ALL huge pages sizes.
>=20
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

This could change the error messages for a wrong setup on archs, but I
guess it's not a big deal, assuming even to capture error people will
majorly still look for error lines in general..

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu

