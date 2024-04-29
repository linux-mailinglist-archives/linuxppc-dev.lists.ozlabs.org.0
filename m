Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 714828B5A8D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 15:52:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1GjTcmX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1GjTcmX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSlB80bbHz3cbF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 23:52:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1GjTcmX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1GjTcmX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSl9N0Qcyz3cLL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 23:51:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714398677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8tbMD2h7PJ3lWi6PtX11/1+14job09F9/bpkbzHIXK8=;
	b=T1GjTcmXBqkFmfEFLhls6bEKwVwFv6gvsbJsAhcH74JOXfQ3BJCrPaqltyTbUF0snPKKoO
	BwWBF11Rj8Myg0imCJtQLSENaCfkYlX6dTiWt3nfKQjJtryx3TETE940HSegDwuSykiZ8H
	gdYAn/EOWKhFLUHmBWP3lilUqhZxZvE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714398677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8tbMD2h7PJ3lWi6PtX11/1+14job09F9/bpkbzHIXK8=;
	b=T1GjTcmXBqkFmfEFLhls6bEKwVwFv6gvsbJsAhcH74JOXfQ3BJCrPaqltyTbUF0snPKKoO
	BwWBF11Rj8Myg0imCJtQLSENaCfkYlX6dTiWt3nfKQjJtryx3TETE940HSegDwuSykiZ8H
	gdYAn/EOWKhFLUHmBWP3lilUqhZxZvE=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-cwDC6jPRPFOZTT5K4bpJrw-1; Mon, 29 Apr 2024 09:51:15 -0400
X-MC-Unique: cwDC6jPRPFOZTT5K4bpJrw-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-61bb2b4204eso5536607b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 06:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714398674; x=1715003474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tbMD2h7PJ3lWi6PtX11/1+14job09F9/bpkbzHIXK8=;
        b=Nafniqx5tH1c5NumIHypierA93Cem/pyYO8Z5D2zDDKUM2GYsT1Y/hdGE14YNzEWV5
         dBjrMFRmn7he+1+FoIFL7b/KvlY1SuxWUNba9sAtCX11MIEBKsQ4kk9wmfKFeCRQV6Nv
         Jf/Hob8N8Mlj2Rm4tcNONRIudNxk2YHKz6P18wdw8pc4BE5E4cZzdnUmNeRLxdTMn3xx
         PGLshNFZTOlKac8kJu04vfZh87aluN3E4aAsPlP0IuQBbgOfbwkysjei6Zs6QvivvRjL
         jmvuc8MeOmSMQkVWxWbsJ26EW9ObIWrfIP/Tkqwfc/Ivze9je9amQn3vvd0nSUQJHUWA
         z7TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfIKnCURlPbBJTTgFbSpkge6SQLQnPVrmfqhMkAupqKcuJopKIsnL0iyldX3VU8nKcsSxcElWFrfKumcBIKPOoNI6XgB9fsiHx7oZKmw==
X-Gm-Message-State: AOJu0YyCHsiSlX3+evrNSaGdyp3W4PNpSUG8lCMU+HGxGMCVu6GX47Vd
	w5Ho9fEDJfBy1UQKwTJzz+L0PsCOIT6mxE6LYU16npuDGZpeH5OtTxp7k1afRF0VjprSov8OaCK
	qyppbfhIDsCGFTq/pFbusG/x0uy2ieDYxDzJgC0weU2rrBLFSlTrvcjSNOmjBC18=
X-Received: by 2002:a25:b29f:0:b0:de4:5c38:40b8 with SMTP id k31-20020a25b29f000000b00de45c3840b8mr9172209ybj.6.1714398673775;
        Mon, 29 Apr 2024 06:51:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzbclBqcimK4lAEWdX1Uas2H83fsLI+db0WSQp/ICCVyIzSWiD5cYwnQ01wud/FLiGmgLing==
X-Received: by 2002:a25:b29f:0:b0:de4:5c38:40b8 with SMTP id k31-20020a25b29f000000b00de45c3840b8mr9172187ybj.6.1714398673284;
        Mon, 29 Apr 2024 06:51:13 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id fu48-20020a05622a5db000b0043781985244sm10433284qtb.59.2024.04.29.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 06:51:13 -0700 (PDT)
Date: Mon, 29 Apr 2024 09:51:10 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] mm/selftests: Don't prefault in gup_longterm tests
Message-ID: <Zi-lzjgoEiBGlsrX@x1n>
References: <20240428190151.201002-1-peterx@redhat.com>
 <20240428190151.201002-3-peterx@redhat.com>
 <4171dbb6-81c0-4553-a405-a55f75be4cb7@redhat.com>
 <Zi-cONgqV4_kUIE4@x1n>
 <2338119d-060b-4127-9199-5ff39fd62fc4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2338119d-060b-4127-9199-5ff39fd62fc4@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, John Hubbard <jhubbard@nvidia.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2024 at 03:26:22PM +0200, David Hildenbrand wrote:
> > The test patch here doesn't need to rush. David, how about you prepare a
> > better and verified patch and post it separately, making sure to cover all
> > the things we used to cover plus the unshare?  IIUC it used to be not
> > touched because of pte_write() always returns true with a write prefault.
> > 
> > Then we let patch 1 go through first, and drop this one?
> 
> Whatever you prefer!

Thanks!

Andrew, would you consider taking patch 1 but ignore this patch 2? Or do
you prefer me to resend?

-- 
Peter Xu

