Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A091886F9F4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 07:18:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aYY7mcs9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aYY7mcs9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tp7mj1khJz3cRB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 17:18:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aYY7mcs9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aYY7mcs9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tp7lw6gx1z3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 17:17:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709533064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O+fO6j0tC3hoYWlaRzxgXQx+mHiiCB/NggfeHPRfEfg=;
	b=aYY7mcs9jrk1e9aPb0rjAtH36F11La2SgLuO+JhbbxftSMJnhSAkekPMaWT04sSuCHiY09
	vbuArhnl/2tLrS4hFenq+XzfQq7EzGRz8S4CQexTQuFJHRFS0q7UCVDbSaCRQfpT3F6aLy
	wZxwUZPtYmSnFiU/ilTa4PsmqpnAQWA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709533064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O+fO6j0tC3hoYWlaRzxgXQx+mHiiCB/NggfeHPRfEfg=;
	b=aYY7mcs9jrk1e9aPb0rjAtH36F11La2SgLuO+JhbbxftSMJnhSAkekPMaWT04sSuCHiY09
	vbuArhnl/2tLrS4hFenq+XzfQq7EzGRz8S4CQexTQuFJHRFS0q7UCVDbSaCRQfpT3F6aLy
	wZxwUZPtYmSnFiU/ilTa4PsmqpnAQWA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-hU9aojI1N6u3bOw65OVl8g-1; Mon, 04 Mar 2024 01:17:42 -0500
X-MC-Unique: hU9aojI1N6u3bOw65OVl8g-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42ed6809154so34287921cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Mar 2024 22:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709533061; x=1710137861;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+fO6j0tC3hoYWlaRzxgXQx+mHiiCB/NggfeHPRfEfg=;
        b=rPIKprLPDNNQxzbXF0uCELA+PLf7GaoL1KoX7abrApF+2LueEqN8+LWyy48T+F+j0e
         Rw4/E9Z8Pb4sSnZVkcRmUXWbiR71orCMquyhMOYWerOkUQ6ucEfdfguZdUDsC8Z81Gl3
         ZhtRucW3+jMIH/F9bit0wqd+dNA73RnlTwTLmFOzmsso+d8RwEjo1Oe1SkCQl0Fzrjjt
         7uwzNu3o5Heee+Kk+WPfHdmFChdkQkziaHPMe3KAzcYvoutCfYTPqBC2zI6tVAPQXIHO
         mxHYUUJKY4Za0dPTmJM80s/4YL9It2Y9UD4YLKHlHQtPUGLgY5E+MS2ZZ7uN+F5GunRG
         a5jg==
X-Forwarded-Encrypted: i=1; AJvYcCUOHkv0EP+U4+zd/J0bpSyOBuoFN+iErmiCXwL9v9+p3N7HzSfEG7DhJoBPlrjKN2TqIwINO61W6MOYi9/Wl700y+kP0LtCY4KClDsqQA==
X-Gm-Message-State: AOJu0YwlWkTwbAqsoCsM7S0bQJ32584qr9+qiBZ0m3k+vjd0MeTxc7+d
	tFVa+iNfuJqDdb7m9wI2PMWeQ4wY8E4syQnsSjTT87nnL0xpPOWWnahf2UHnEAxthwG//2rHVhm
	T6uOxCjhtLnjowTaCf41UXV62fkf/juGI3ERo3lvkDrZjSIvkWrPU9YPFX3fx9fI=
X-Received: by 2002:ac8:5ac2:0:b0:42e:d2f2:71f2 with SMTP id d2-20020ac85ac2000000b0042ed2f271f2mr11566454qtd.23.1709533061690;
        Sun, 03 Mar 2024 22:17:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTwt3A1nfxsBAOT9o42hUQSyWoxM3TY/5qVm2pNryLGHmXlVu2wbWYv1lpVD9oV398f6MfcA==
X-Received: by 2002:ac8:5ac2:0:b0:42e:d2f2:71f2 with SMTP id d2-20020ac85ac2000000b0042ed2f271f2mr11566436qtd.23.1709533061382;
        Sun, 03 Mar 2024 22:17:41 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id lr9-20020a0562145bc900b006904ca1971esm4405485qvb.42.2024.03.03.22.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Mar 2024 22:17:41 -0800 (PST)
Message-ID: <6329dd4c-2093-40c3-8eb8-701d8e8b2ecd@redhat.com>
Date: Mon, 4 Mar 2024 07:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 5/7] arch-run: Add a "continuous" migration
 option for tests
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226093832.1468383-1-npiggin@gmail.com>
 <20240226093832.1468383-6-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240226093832.1468383-6-npiggin@gmail.com>
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
> The cooperative migration protocol is very good to control precise
> pre and post conditions for a migration event. However in some cases
> its intrusiveness to the test program, can mask problems and make
> analysis more difficult.
> 
> For example to stress test migration vs concurrent complicated
> memory access, including TLB refill, ram dirtying, etc., then the
> tight spin at getchar() and resumption of the workload after
> migration is unhelpful.
> 
> This adds a continuous migration mode that directs the harness to
> perform migrations continually. This is added to the migration
> selftests, which also sees cooperative migration iterations reduced
> to avoid increasing test time too much.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   common/selftest-migration.c | 16 +++++++++--
>   lib/migrate.c               | 18 ++++++++++++
>   lib/migrate.h               |  3 ++
>   scripts/arch-run.bash       | 55 ++++++++++++++++++++++++++++++++-----
>   4 files changed, 82 insertions(+), 10 deletions(-)
> 
> diff --git a/common/selftest-migration.c b/common/selftest-migration.c
> index 0afd8581c..9a9b61835 100644
> --- a/common/selftest-migration.c
> +++ b/common/selftest-migration.c
> @@ -9,12 +9,13 @@
>    */
>   #include <libcflat.h>
>   #include <migrate.h>
> +#include <asm/time.h>
>   
> -#define NR_MIGRATIONS 30
> +#define NR_MIGRATIONS 15
>   
>   int main(int argc, char **argv)
>   {
> -	report_prefix_push("migration");
> +	report_prefix_push("migration harness");
>   
>   	if (argc > 1 && !strcmp(argv[1], "skip")) {
>   		migrate_skip();
> @@ -24,7 +25,16 @@ int main(int argc, char **argv)
>   
>   		for (i = 0; i < NR_MIGRATIONS; i++)
>   			migrate_quiet();
> -		report(true, "simple harness stress");
> +		report(true, "cooperative migration");
> +
> +		migrate_begin_continuous();
> +		mdelay(2000);
> +		migrate_end_continuous();
> +		mdelay(1000);
> +		migrate_begin_continuous();
> +		mdelay(2000);
> +		migrate_end_continuous();
> +		report(true, "continuous migration");
>   	}
>   
>   	report_prefix_pop();
> diff --git a/lib/migrate.c b/lib/migrate.c
> index 1d22196b7..770f76d5c 100644
> --- a/lib/migrate.c
> +++ b/lib/migrate.c
> @@ -60,3 +60,21 @@ void migrate_skip(void)
>   	puts("Skipped VM migration (quiet)\n");
>   	(void)getchar();
>   }
> +
> +void migrate_begin_continuous(void)
> +{
> +	puts("Begin continuous migration\n");
> +	(void)getchar();
> +}
> +
> +void migrate_end_continuous(void)
> +{
> +	/*
> +	 * Migration can split this output between source and dest QEMU
> +	 * output files, print twice and match once to always cope with
> +	 * a split.
> +	 */
> +	puts("End continuous migration\n");
> +	puts("End continuous migration (quiet)\n");
> +	(void)getchar();
> +}
> diff --git a/lib/migrate.h b/lib/migrate.h
> index db6e0c501..35b6703a2 100644
> --- a/lib/migrate.h
> +++ b/lib/migrate.h
> @@ -11,3 +11,6 @@ void migrate_quiet(void);
>   void migrate_once(void);
>   
>   void migrate_skip(void);
> +
> +void migrate_begin_continuous(void);
> +void migrate_end_continuous(void);
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index d0f6f098f..5c7e72036 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -125,15 +125,17 @@ qmp_events ()
>   filter_quiet_msgs ()
>   {
>   	grep -v "Now migrate the VM (quiet)" |
> +	grep -v "Begin continuous migration (quiet)" |
> +	grep -v "End continuous migration (quiet)" |
>   	grep -v "Skipped VM migration (quiet)"
>   }
>   
>   seen_migrate_msg ()
>   {
>   	if [ $skip_migration -eq 1 ]; then
> -		grep -q -e "Now migrate the VM" < $1
> +	        grep -q -e "Now migrate the VM" -e "Begin continuous migration" < $1
>   	else
> -		grep -q -e "Now migrate the VM" -e "Skipped VM migration" < $1
> +	        grep -q -e "Now migrate the VM" -e "Begin continuous migration" -e "Skipped VM migration" < $1
>   	fi
>   }
>   
> @@ -161,6 +163,7 @@ run_migration ()
>   	src_qmpout=/dev/null
>   	dst_qmpout=/dev/null
>   	skip_migration=0
> +	continuous_migration=0
>   
>   	mkfifo ${src_outfifo}
>   	mkfifo ${dst_outfifo}
> @@ -186,9 +189,12 @@ run_migration ()
>   	do_migration || return $?
>   
>   	while ps -p ${live_pid} > /dev/null ; do
> -		# Wait for test exit or further migration messages.
> -		if ! seen_migrate_msg ${src_out} ;  then
> +		if [[ ${continuous_migration} -eq 1 ]] ; then

Here you're using "[[" for testing ...

> +			do_migration || return $?
> +		elif ! seen_migrate_msg ${src_out} ;  then
>   			sleep 0.1
> +		elif grep -q "Begin continuous migration" < ${src_out} ; then
> +			do_migration || return $?
>   		elif grep -q "Now migrate the VM" < ${src_out} ; then
>   			do_migration || return $?
>   		elif [ $skip_migration -eq 0 ] && grep -q "Skipped VM migration" < ${src_out} ; then

... while the other code seems to use "[" for testing values. Can we try to 
stick to one style, please (unless it's really required to use "[[" somewhere)?

  Thanks,
   Thomas

