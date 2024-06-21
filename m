Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F2912E79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 22:28:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SATzZSo4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SATzZSo4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5TTD3BPvz30Wd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 06:28:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SATzZSo4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SATzZSo4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5TSX6fdCz3cYb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 06:27:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719001671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22pIrWQAypdIZ5Rg6Bb3sV1iFixhfYe7whIUT2M8qwY=;
	b=SATzZSo4Ulx43WLhJTtW7D+xLIpdNQgJSpcNzlwEwTelE8m30T9mRP1/KoIMWDn6LaDlsj
	hMmtlF5ngc6vdBgq5+h8dVwIcM7tS9vgmsuYW/Pc2bpGdCsB9FWyxwhOsqS3DEH/LWTmXK
	mZtvIDLNsxaU/jaokIQ6BTOVqyt5o98=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719001671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22pIrWQAypdIZ5Rg6Bb3sV1iFixhfYe7whIUT2M8qwY=;
	b=SATzZSo4Ulx43WLhJTtW7D+xLIpdNQgJSpcNzlwEwTelE8m30T9mRP1/KoIMWDn6LaDlsj
	hMmtlF5ngc6vdBgq5+h8dVwIcM7tS9vgmsuYW/Pc2bpGdCsB9FWyxwhOsqS3DEH/LWTmXK
	mZtvIDLNsxaU/jaokIQ6BTOVqyt5o98=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-JZAp9RUcNvqgNyIxPlksag-1; Fri, 21 Jun 2024 16:27:49 -0400
X-MC-Unique: JZAp9RUcNvqgNyIxPlksag-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5bda84e2c81so163214eaf.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 13:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719001669; x=1719606469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22pIrWQAypdIZ5Rg6Bb3sV1iFixhfYe7whIUT2M8qwY=;
        b=WREMe2bBh8Gpe8BB9MZa9Tv52f2UcBsXPopJkWKfiQWQS8btjjAXuhxveE2ac8/OGH
         QxROtQTQvwLEkzwB8eH0hyk580lpgvIK7mjGNcaMew8B2tTua+pYzTIKB6h9FPRa+ItL
         LGVWlPE1YkAvVTUAmCFBJn1n+qBuleLK7M2CNteVKNeO+bb6xcB/78PBCz73j1MUkU44
         wLzJaPzgfONFFY3SsUWHv2eRDCqgfxyMjI5McirtER2W/xXHeibo/d3VteMB3D9/S2jK
         5cTMaiGFfXBFaiubUlWd7JbALR9xDaiKNLanEHC55vE34ukHRxLxDCJSXNwTDLyAVbwA
         K+UA==
X-Forwarded-Encrypted: i=1; AJvYcCUCO2w3O5HpzhoiYIFGLyYE5xRu0Q+6UQXIoysxVGKaNjTMa0d4ABvDVZx4Hy0mqYwkO/5UzTgDq5Y4WIm5rFmxaAaeonGILGrU18hPXQ==
X-Gm-Message-State: AOJu0YyGXER7fj0z0su4Hy8IrWX2iwGhwE/HLfoBrWr4xslIEfuOT04Y
	Hr4j5hF7Da2Ixww1ugo/NGC1u8USz40Qx54Yg811uXpY+7kjwq/ZX93t+YnDd0z40GJN0f747jr
	ndWnJymk0ONaXTyDNlylHbBon1y52jEp06HgJzBG8O4grrIKQ6qs1NOlt3O4Z0VA=
X-Received: by 2002:a05:6358:5905:b0:1a1:fdee:fb5d with SMTP id e5c5f4694b2df-1a2310ec6f4mr36972055d.1.1719001668846;
        Fri, 21 Jun 2024 13:27:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnQONlRBQfB2WimAlD7suCOv/AMwePZpfZM1R4sEwSWsu+GFC5PQy+iV7t7DTH9Ud/XUjInA==
X-Received: by 2002:a05:6358:5905:b0:1a1:fdee:fb5d with SMTP id e5c5f4694b2df-1a2310ec6f4mr36967655d.1.1719001668167;
        Fri, 21 Jun 2024 13:27:48 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce92e6b4sm113770785a.100.2024.06.21.13.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 13:27:47 -0700 (PDT)
Date: Fri, 21 Jun 2024 16:27:44 -0400
From: Peter Xu <peterx@redhat.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 6/7] mm/x86: Add missing pud helpers
Message-ID: <ZnXiQAJsKPBAKa6b@x1n>
References: <20240621142504.1940209-1-peterx@redhat.com>
 <20240621142504.1940209-7-peterx@redhat.com>
 <4fb4b087-cae2-4516-a34e-cb4c72be13eb@intel.com>
 <db95c7abea9cd252a791d15359a4d940d91524e3.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <db95c7abea9cd252a791d15359a4d940d91524e3.camel@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "Hansen, Dave" <dave.hansen@intel.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "Williams, Dan J" <dan.j.williams@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "x86@kernel.org" <x86@kernel.org>, "hughd@google.com" <hughd@google.com>, "willy@infradead.org" <willy@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "Huang, Ying" <ying.huang@intel.com>, "riel@surriel.com" <riel@surriel.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "bp@alien8.de" <bp@alien8.de>, "kirill@shutemov.name" <kirill@shutemov.name>, "tglx@linutronix.de" <tglx@linutronix.de>, "vbabka@suse.cz" <vbabka@suse.cz>, "osalvador@suse.de" <osalvador@suse.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 07:36:30PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2024-06-21 at 07:51 -0700, Dave Hansen wrote:
> > 
> > But, still, what if you take a Dirty=1,Write=1 pud and pud_modify() it
> > to make it Dirty=1,Write=0?  What prevents that from being
> > misinterpreted by the hardware as being a valid 1G shadow stack mapping?
> 
> Hmm, it looks like we could use an arch_check_zapped_pud() that does a warning
> like arch_check_zapped_pte/pmd() too. Not that we had no use for one before
> this.

I can definitely look into that, but this check only happens when zapping,
and IIUC it means there can still be outliers floating around.  I wonder
whether it should rely on page_table_check_pxx_set() from that regard.

Thanks,

-- 
Peter Xu

