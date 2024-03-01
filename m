Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E243886E22A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 14:33:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DCZPzmHN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DCZPzmHN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmTZM3MH1z3vdh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 00:33:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DCZPzmHN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DCZPzmHN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmTYZ5j2Xz3dhk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Mar 2024 00:33:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709299983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lRrZ49EeCBRPggg9ASeyz3DJTLJRzQqZi93PdwIxr2g=;
	b=DCZPzmHN7APqYMrQAukIe3BVvHl4WMqBCYe2zVh0BD0qpEWVAW1ovytmjrIkwNFERUvVjr
	SCGw+eXm5tIPWrNIt/Zzc6V0rGxpheDFYc9euDiAJRP6LHtowvV7rhAz2GwMUkKH7OWEkq
	g+I4k+wb+r4MzyKS4yCiN3LhGecVTH0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709299983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lRrZ49EeCBRPggg9ASeyz3DJTLJRzQqZi93PdwIxr2g=;
	b=DCZPzmHN7APqYMrQAukIe3BVvHl4WMqBCYe2zVh0BD0qpEWVAW1ovytmjrIkwNFERUvVjr
	SCGw+eXm5tIPWrNIt/Zzc6V0rGxpheDFYc9euDiAJRP6LHtowvV7rhAz2GwMUkKH7OWEkq
	g+I4k+wb+r4MzyKS4yCiN3LhGecVTH0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-bAmjgDaLMWiuhENObC-ZeA-1; Fri, 01 Mar 2024 08:33:01 -0500
X-MC-Unique: bAmjgDaLMWiuhENObC-ZeA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7880bddf5efso57164285a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Mar 2024 05:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709299979; x=1709904779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRrZ49EeCBRPggg9ASeyz3DJTLJRzQqZi93PdwIxr2g=;
        b=VbJXGT/FUtqpUQjvmSajGUlGL/8bVB94sAtTTgaWCac7fVivnV91lHwCqWBvHRyZfj
         eSA5buR7By7XbZq6rl7SwFMfA66TqWtLOk2+B25iPXtb8HlbI3x+wX8Pu80fjWU9BrwV
         tFr8aexMiDOkOz3T9cu3new10nBbIgSYPiNYOx+57WxacmTaC9DlhPPHVQ2W3/FeWBvr
         NZk3AB4mUEg2eeL/UQogrZC3ILBqnMGy06OR+TDZkbheaqFcMEe0k17M6GOrMPhJ4U5/
         LiJ03Ub/xmFnBro9jZiYRFindpYgKFW8VrmyiNJHa/IY6g82TrikDStHoGZqr0XVQvfM
         Gh1w==
X-Forwarded-Encrypted: i=1; AJvYcCV/yh+RPbw6aianZgwC0RY+8ndVfbfygQLd3zSGIdA/zR999Cv+M/KtS+e5RHgiKevveRPJ87OwPngy/JcAgTdrzsGHVC2/G9/T2hlO5A==
X-Gm-Message-State: AOJu0YwLJjaNnT50DN3WY///3GN6ql0mq1UF70GQmqg4+vESWU6ajJtX
	hUF1WhyWV8rlMmPzKH7cTRrEQuAghj77gXA2ZWg+ztqIUEBoWT8CHrWbTQF38j36Qt9E/W0obOP
	dAa2rNd6SSQELwpimp+/JoA98eEplpXHyEtfD9tXwe+AOJoJ+sCOnpEC+iCuW0QM=
X-Received: by 2002:a05:620a:158c:b0:787:ba6c:65c3 with SMTP id d12-20020a05620a158c00b00787ba6c65c3mr1583199qkk.21.1709299979507;
        Fri, 01 Mar 2024 05:32:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7DBxLg18an/NNcRDDOTDpdJ7QCDRh9RX/3rqDqE/BSDlt5DQxOty6xZ0bcfxamgoIxBXd7w==
X-Received: by 2002:a05:620a:158c:b0:787:ba6c:65c3 with SMTP id d12-20020a05620a158c00b00787ba6c65c3mr1583168qkk.21.1709299979156;
        Fri, 01 Mar 2024 05:32:59 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id g27-20020a05620a109b00b00787f7d5a727sm1635652qkk.44.2024.03.01.05.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 05:32:58 -0800 (PST)
Message-ID: <e802a3a4-5ab7-447f-b09b-75d710ba7bd6@redhat.com>
Date: Fri, 1 Mar 2024 14:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 1/7] arch-run: Keep infifo open
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226093832.1468383-1-npiggin@gmail.com>
 <20240226093832.1468383-2-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240226093832.1468383-2-npiggin@gmail.com>
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
> The infifo fifo that is used to send characters to QEMU console is
> only able to receive one character before the cat process exits.
> Supporting interactions between test and harness involving multiple
> characters requires the fifo to remain open.
> 
> This also allows us to let the cat out of the bag, simplifying the
> input pipeline.

LOL, we rather let the cat out of the subshell now, but I like the play on 
words :-)

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   scripts/arch-run.bash | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 6daef3218..e5b36a07b 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -158,6 +158,11 @@ run_migration ()
>   	mkfifo ${src_outfifo}
>   	mkfifo ${dst_outfifo}
>   
> +	# Holding both ends of the input fifo open prevents opens from
> +	# blocking and readers getting EOF when a writer closes it.
> +	mkfifo ${dst_infifo}
> +	exec {dst_infifo_fd}<>${dst_infifo}
> +
>   	eval "$migcmdline" \
>   		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
>   		-mon chardev=mon,mode=control > ${src_outfifo} &
> @@ -191,14 +196,10 @@ run_migration ()
>   
>   do_migration ()
>   {
> -	# We have to use cat to open the named FIFO, because named FIFO's,
> -	# unlike pipes, will block on open() until the other end is also
> -	# opened, and that totally breaks QEMU...
> -	mkfifo ${dst_infifo}
>   	eval "$migcmdline" \
>   		-chardev socket,id=mon,path=${dst_qmp},server=on,wait=off \
>   		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
> -		< <(cat ${dst_infifo}) > ${dst_outfifo} &
> +		< ${dst_infifo} > ${dst_outfifo} &
>   	incoming_pid=$!
>   	cat ${dst_outfifo} | tee ${dst_out} | filter_quiet_msgs &
>   
> @@ -245,7 +246,6 @@ do_migration ()
>   
>   	# keypress to dst so getchar completes and test continues
>   	echo > ${dst_infifo}
> -	rm ${dst_infifo}

I assume it will not get deleted by the trap handler? ... sounds fine to me, 
so I dare to say:

Reviewed-by: Thomas Huth <thuth@redhat.com>


