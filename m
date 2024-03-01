Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1110186E2BD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 14:50:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MWd1GuHA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MWd1GuHA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmTxC4ncQz3vYb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 00:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MWd1GuHA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MWd1GuHA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmTwR3LCvz30f5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Mar 2024 00:49:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709300964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=B4Q4Q4LrAxLQsEJ1nzM2u+gYauPHsp+I5fupvnZdXis=;
	b=MWd1GuHAgtyj/iAULEM81PTsMNOegQ4jl8HkdX/Q+22/Upxfbe6cKKD2kRcwM27mCK0ePW
	meGcdb8KqetHbiVo+aCExRVovDl70IBLFrT0mOP1Dw67qvS5wjOrNzBzusFRpcpUDfJ+tQ
	KmM4mJy0FuCk4UiWFPCKzkTSEKXYTsc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709300964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=B4Q4Q4LrAxLQsEJ1nzM2u+gYauPHsp+I5fupvnZdXis=;
	b=MWd1GuHAgtyj/iAULEM81PTsMNOegQ4jl8HkdX/Q+22/Upxfbe6cKKD2kRcwM27mCK0ePW
	meGcdb8KqetHbiVo+aCExRVovDl70IBLFrT0mOP1Dw67qvS5wjOrNzBzusFRpcpUDfJ+tQ
	KmM4mJy0FuCk4UiWFPCKzkTSEKXYTsc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-Ya4zfeL2NZmJMME0VxYiNQ-1; Fri, 01 Mar 2024 08:49:20 -0500
X-MC-Unique: Ya4zfeL2NZmJMME0VxYiNQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-787c04e48a7so228345185a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Mar 2024 05:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709300960; x=1709905760;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4Q4Q4LrAxLQsEJ1nzM2u+gYauPHsp+I5fupvnZdXis=;
        b=NSZ5fvNX2jsKqjEBbg3sQJqWoQarURp82LaRaDBI/PAPDvJC9f+LSYRw23MWUGlJ/s
         uKruYQXn8xLyYyv4ADgf4NcnGMxx/g7qEsBRWb9r5ejkCugz8ScHBIgXGU6r5BStp7Cg
         smFZF7/CG0HTGQ4eze+zYRPpjUgpEI2GFESziMyMC99K9ASHZ4czWuzGCD4mFPdQxeY5
         9XSv4Tlemk2o5+PNlT6ym7zdbacSSz01YWloA3N6NCfMnqCKU/hVSdmkPKzwiiMNBbMR
         BAh3u0mQdAsvRvtAdq/oXDrp3gIcYiYhqlhj9gkeyPttE0VyLzM1WKQt5r6sZjf9PA9H
         oSRw==
X-Forwarded-Encrypted: i=1; AJvYcCWzRdj4SNGIr85zZSbVkwrikTG06Ui38Jl6/rsZ0OEkgOSzSF58mFnBWWPW7ZcViKBS4owUVyAH6EIT+HgvZpathqAKTXAQLDHGptyPwg==
X-Gm-Message-State: AOJu0YyShmACuFeQFHbKZiryqBmQ86ZFOO28m2bNYQdNeFQBbkKxw6A5
	/HyH7cemTZcCdw5chDGtgCI3e2S5mGez0HTGcuTcBr9aTpXa5ZHMIU6WvrtV2lkDBzBcip62cb/
	giQqDl1043S43ThBtiig1M/8O+bwy705t0DRbGGVDH8hWnS50W4J8QuAlR+LsHZA=
X-Received: by 2002:a05:620a:1083:b0:787:f466:bc9e with SMTP id g3-20020a05620a108300b00787f466bc9emr1722862qkk.16.1709300960033;
        Fri, 01 Mar 2024 05:49:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGa6sgVtEll3K3BbX7X5s71qOw70Yvse3T0Tb91aAoaGGSIHp0XgmZcezKDxj2a3uiFiUxnBw==
X-Received: by 2002:a05:620a:1083:b0:787:f466:bc9e with SMTP id g3-20020a05620a108300b00787f466bc9emr1722846qkk.16.1709300959791;
        Fri, 01 Mar 2024 05:49:19 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id p13-20020ae9f30d000000b007873213b29csm1645214qkg.49.2024.03.01.05.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 05:49:19 -0800 (PST)
Message-ID: <3579c50c-e1dd-41db-9537-b8e36b3be18a@redhat.com>
Date: Fri, 1 Mar 2024 14:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 3/7] (arm|s390): Use migrate_skip in test
 cases
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226093832.1468383-1-npiggin@gmail.com>
 <20240226093832.1468383-4-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240226093832.1468383-4-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/02/2024 10.38, Nicholas Piggin wrote:
> Have tests use the new migrate_skip command in skip paths, rather than
> calling migrate_once to prevent harness reporting an error.
> 
> s390x/migration.c adds a new command that looks like it was missing
> previously.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arm/gic.c              | 21 ++++++++++++---------
>   s390x/migration-cmm.c  |  8 ++++----
>   s390x/migration-skey.c |  4 +++-
>   s390x/migration.c      |  1 +
>   4 files changed, 20 insertions(+), 14 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

