Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295645333C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 14:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtnW8118sz2ymt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 00:50:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HvGUiNBy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HvGUiNBy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=HvGUiNBy; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=HvGUiNBy; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtnVT5Hjmz2xtM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 00:49:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637070571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w00cP//oO+88K/Y2lFYbKr4Ng9e/d98pV+/20CZ3Uq4=;
 b=HvGUiNBy99b3zNOiX4WFMVDtYJt7j98s3JJr80vvAg5vZ3GuCF4FPavrx75uM1jWDIPKCZ
 keIfwDMxpth6v8MreDWwmfqEnxhLDyIzbgD1YWU0YyF4CmEGgYHZBLz92Q5p93CoT5pmFY
 WrNNm0JQFZOT+Qo0EfHcsRS1cJEl3Ac=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637070571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w00cP//oO+88K/Y2lFYbKr4Ng9e/d98pV+/20CZ3Uq4=;
 b=HvGUiNBy99b3zNOiX4WFMVDtYJt7j98s3JJr80vvAg5vZ3GuCF4FPavrx75uM1jWDIPKCZ
 keIfwDMxpth6v8MreDWwmfqEnxhLDyIzbgD1YWU0YyF4CmEGgYHZBLz92Q5p93CoT5pmFY
 WrNNm0JQFZOT+Qo0EfHcsRS1cJEl3Ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-CYdHIWN-MYyQSKOSjn05jw-1; Tue, 16 Nov 2021 08:49:29 -0500
X-MC-Unique: CYdHIWN-MYyQSKOSjn05jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36C7B1922038;
 Tue, 16 Nov 2021 13:49:27 +0000 (UTC)
Received: from [10.39.192.245] (unknown [10.39.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 711601970E;
 Tue, 16 Nov 2021 13:49:09 +0000 (UTC)
Message-ID: <02c44f36-5467-4dce-b0f9-af96d6286e20@redhat.com>
Date: Tue, 16 Nov 2021 14:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/5] KVM: Move wiping of the kvm->vcpus array to common
 code
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, Sean Christopherson <seanjc@google.com>
References: <20211105192101.3862492-1-maz@kernel.org>
 <20211105192101.3862492-2-maz@kernel.org> <YYWQHBwD4nBLo9qi@google.com>
 <87o86xednu.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87o86xednu.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Juergen Gross <jgross@suse.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Anup Patel <anup.patel@wdc.com>,
 Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, David Hildenbrand <david@redhat.com>,
 linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Atish Patra <atish.patra@wdc.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@samba.org>, James Morse <james.morse@arm.com>,
 kernel-team@android.com, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/6/21 12:17, Marc Zyngier wrote:
> 
> If you too believe that this is just wrong, I'm happy to drop the
> locking altogether. If that breaks someone's flow, they'll shout soon
> enough.

Yes, it's not necessary.  It was added in 2009 (commit 988a2cae6a3c, 
"KVM: Use macro to iterate over vcpus.") and it was unnecessary back 
then too.

Paolo

