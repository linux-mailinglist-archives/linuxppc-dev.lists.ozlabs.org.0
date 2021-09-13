Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6C4098FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 18:24:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7WzB2gltz2yXf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 02:24:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RKVTfzY0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=RKVTfzY0; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7WyX1dglz2xrS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 02:24:19 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id v19so4044496pjh.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q0CGByNGBLX5VAdHy/UUqDDhbh6zFNghWMoOnFHZGGw=;
 b=RKVTfzY0+sEOlHZwMw4vPz+GvPXyX750p2mC7wWOXKxWfCoapA8MjCsz6G9dj02/wG
 B3XA0COQxzdKlQnGZdkEIklM+WI1cCOz+NXBUmQAkuk6QYoRk2zuC5o5qdb+Waer+AG6
 OJfpQmWIx+uSLeokuBis+oQjVfX0ehooADGOWTQJL7kvEiY2whnhENiIBsCY1yS7miFs
 eIwDCSG3arqEXzSdyaQ8k4NCpo1gSL9V/1EeiI4I0/s0VJZhs1z0e/EcQVIbBvac32A4
 s/tiDk2BF9PVxJ1n8cTLxrdDzppZo/ZkmBIG/TmGcUI4PbafbQvkNhTqwB0iH4JdKWBE
 B1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q0CGByNGBLX5VAdHy/UUqDDhbh6zFNghWMoOnFHZGGw=;
 b=bm+hg6xYCw9I3zI7YHw0+o8SR8NtFcpe9Ia4hfK/zGzZQQ08Aurm03f5chE3vl2c2K
 cT1hBq4Dam3VPwFKAkCrOJb2nCujqENT/7jBMm3PibObJMxNeQmL4RQjLG37oJr/BY+9
 v81KSMSNyEtbONg2n54afqN9yXN2FMUyW9EX/QGJDroimQSBRBnRP4iRKLz3117ZFUqd
 /7rvs9uvjnR4m/lbQsfDS7ELSbVUrmg4jhxZ/HOEGF0sUUSk2hx12DHV7PYH/DG+fbe3
 bU6itJpqDRcvmSTQQPCqKQDymi93iOI/6yG9J7ZTwT3+a6qV4e7gS9Lxtw1y7eFcLcoh
 Wv3Q==
X-Gm-Message-State: AOAM5319wtDsr7BN/UfS1qRNWsw9kzBUbKA4I29TTidqRhMhRV9k7GHU
 Ao86flWGJF1fabI4q+iXoqHyRw==
X-Google-Smtp-Source: ABdhPJxf1CW8M7Ti4tr+U9bXba0ZjdRcakxdnIlaD1AcyqYZi788mkJc1rFObUJoedvExK8OgSG5Tw==
X-Received: by 2002:a17:902:c94f:b0:13b:8359:9506 with SMTP id
 i15-20020a170902c94f00b0013b83599506mr9519028pla.33.1631550255767; 
 Mon, 13 Sep 2021 09:24:15 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id b16sm7768188pfr.138.2021.09.13.09.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:24:15 -0700 (PDT)
Date: Mon, 13 Sep 2021 16:24:11 +0000
From: Sean Christopherson <seanjc@google.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] kvm: rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS
Message-ID: <YT97K7yXyCrphyCt@google.com>
References: <20210913135745.13944-1-jgross@suse.com>
 <20210913135745.13944-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913135745.13944-3-jgross@suse.com>
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
Cc: x86@kernel.org, Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm-ppc@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jim Mattson <jmattson@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 13, 2021, Juergen Gross wrote:
> KVM_MAX_VCPU_ID is not specifying the highest allowed vcpu-id, but the
> number of allowed vcpu-ids. This has already led to confusion, so
> rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS to make its semantics more
> clear

My hesitation with this rename is that the max _number_ of IDs is not the same
thing as the max allowed ID.  E.g. on x86, given a capability that enumerates the
max number of IDs, I would expect to be able to create vCPUs with arbitrary 32-bit
x2APIC IDs so long as the total number of IDs is below the max.
