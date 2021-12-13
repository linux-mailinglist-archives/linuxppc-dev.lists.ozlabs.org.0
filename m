Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D7F4732E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 18:27:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCT3g6rmKz3bmS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 04:27:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZKy6R36o;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZKy6R36o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZKy6R36o; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZKy6R36o; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCT2v3V7Kz2ywH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 04:27:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639416418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4o6oVIesfnDo84d/kPIVObUuOUn9rbV/Dxvkbz+Ve8=;
 b=ZKy6R36ojjHB+QaGVcPCYENGT9xy0IMf3B5G2Kb00fbx1uOt/2Ag9Lx3CQ8Uhmc9XfyImc
 qbQqD4XGUIYP2xEHTHSGNQ5Z52WNWLG+ZSoN67yJ/DnP4Da2IiwJhU37+FJ73JaZE4RExY
 QTMuv8sygSsNquTPuHlRVJGbIHG74Qc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639416418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4o6oVIesfnDo84d/kPIVObUuOUn9rbV/Dxvkbz+Ve8=;
 b=ZKy6R36ojjHB+QaGVcPCYENGT9xy0IMf3B5G2Kb00fbx1uOt/2Ag9Lx3CQ8Uhmc9XfyImc
 qbQqD4XGUIYP2xEHTHSGNQ5Z52WNWLG+ZSoN67yJ/DnP4Da2IiwJhU37+FJ73JaZE4RExY
 QTMuv8sygSsNquTPuHlRVJGbIHG74Qc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-W_SHHWMpOGWGJkiE3qdEtA-1; Mon, 13 Dec 2021 12:26:56 -0500
X-MC-Unique: W_SHHWMpOGWGJkiE3qdEtA-1
Received: by mail-qt1-f198.google.com with SMTP id
 s8-20020ac85cc8000000b002b631ea95d4so24049852qta.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 09:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y4o6oVIesfnDo84d/kPIVObUuOUn9rbV/Dxvkbz+Ve8=;
 b=4iOM9KvC6SXMhETPXIQ6EFF9kX4fYUbNotjqEEUsk9V8Yxx44zK1V7e9FE0EsP4jDE
 Sy2XBjjxCYoW7YaeAmBANW+aGvZj8ThZ925xfDO8SbM04iLQO6LEZ+3gw4QQz9+DAEvE
 aDePtEgj8Jvc0/MgGobXpJe04azQlBvvl3SBKftZHrjV4NsJWU4Jrg+5DTVSiuau55XU
 PG2LZ4CGci3lW4z6NMQoasOI1ikAJgNItqB0cZGqRKBjACHLH7jKyuIfwnpMsmRnZccA
 lWsB5wwA2xzt+deY1AsszfDd5D63BoUC7ix2dmWC2TmYgcNiQLnbBDRWbjBTNY1KvMHL
 wLOA==
X-Gm-Message-State: AOAM533LYeOoSHZ2wuhDhXEzV+hwlK8kLtHQ8ZrIYSKTClZttyLO4IMf
 NsmjJ7tAPcV+WQJ+6ziceTrRMhxW89QGaVYO/zNV9Ml79atEBpwZdmFgunJBK75PN9VmL/O8g9D
 mrS+jzoLsNrcg2UMUGlUdQajQ5A==
X-Received: by 2002:a05:622a:1487:: with SMTP id
 t7mr115305qtx.484.1639416416077; 
 Mon, 13 Dec 2021 09:26:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdKNR0RmU/rmZRwD07K87ZQ//xzz4YKuZVanITX8zCfz4ZzTxkAq+LnjECgKjaNNjJywk3Ww==
X-Received: by 2002:a05:622a:1487:: with SMTP id
 t7mr115261qtx.484.1639416415755; 
 Mon, 13 Dec 2021 09:26:55 -0800 (PST)
Received: from [192.168.1.9] (pool-68-163-101-245.bstnma.fios.verizon.net.
 [68.163.101.245])
 by smtp.gmail.com with ESMTPSA id f21sm9581080qte.52.2021.12.13.09.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 09:26:55 -0800 (PST)
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Russell Currey <ruscur@russell.cc>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <YX9UUBeudSUuJs01@redhat.com>
 <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
 <f8a96ac1-fda3-92da-cf27-0992a43a2f3f@redhat.com>
 <bed88ff4-e5d3-4b78-4f28-29fc635c2f97@csgroup.eu>
 <919a79b8-feff-b0a4-b96a-73f376b7f6dc@redhat.com>
 <61a5f29c-5123-5f0f-11aa-91cb0ac95a69@csgroup.eu>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
Message-ID: <8a68ffef-7e0d-b1ff-1102-2e6f2c999455@redhat.com>
Date: Mon, 13 Dec 2021 12:26:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <61a5f29c-5123-5f0f-11aa-91cb0ac95a69@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=joe.lawrence@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 Jessica Yu <jeyu@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/13/21 11:36 AM, Christophe Leroy wrote:
> 
> 
> Le 13/12/2021 à 15:47, Joe Lawrence a écrit :
>> On 12/13/21 2:42 AM, Christophe Leroy wrote:
>>>
>>> Hello Joe,
>>>
>>> I'm implementing LIVEPATCH on PPC32 and I wanted to test with
>>> STRICT_MODULE_RWX enabled so I took your branch as suggested, but I'm
>>> getting the following errors on build. What shall I do ?
>>>
>>>     CALL    scripts/checksyscalls.sh
>>>     CALL    scripts/atomic/check-atomics.sh
>>>     CHK     include/generated/compile.h
>>>     KLP     lib/livepatch/test_klp_convert1.ko
>>> klp-convert: section .rela.klp.module_relocs.test_klp_convert_mod length
>>> beyond nr_entries
>>>
>>> klp-convert: Unable to load user-provided sympos
>>> make[2]: *** [scripts/Makefile.modfinal:79:
>>> lib/livepatch/test_klp_convert1.ko] Error 255
>>>     KLP     lib/livepatch/test_klp_convert2.ko
>>> klp-convert: section .rela.klp.module_relocs.test_klp_convert_mod length
>>> beyond nr_entries
>>>
>>> klp-convert: Unable to load user-provided sympos
>>> make[2]: *** [scripts/Makefile.modfinal:79:
>>> lib/livepatch/test_klp_convert2.ko] Error 255
>>>     KLP     lib/livepatch/test_klp_convert_sections.ko
>>> klp-convert: section .rela.klp.module_relocs.test_klp_convert_mod length
>>> beyond nr_entries
>>>
>>> klp-convert: Unable to load user-provided sympos
>>> make[2]: *** [scripts/Makefile.modfinal:79:
>>> lib/livepatch/test_klp_convert_sections.ko] Error 255
>>> make[2]: Target '__modfinal' not remade because of errors.
>>> make[1]: *** [scripts/Makefile.modpost:145: __modpost] Error 2
>>> make: *** [Makefile:1770: modules] Error 2
>>>
>>
>> Hi Christophe,
>>
>> Interesting failure mode.  That's klp-convert complaining that it found
>> more relocations in a .klp.module_relocs.<objname> section than
>> expected, i.e. nr_entries = sec->size / sizeof(struct klp_module_reloc).
>>
>> A few possibilities: the ELF sec->size was incorrectly set/read by
>> build/libelf (I doubt that).  Or maybe the layout/size of struct
>> klp_module_reloc is not consistent between kernel and userspace (I'm
>> more suspicious of this).
>>
>> Can you post a copy of the build's symbols.klp and
>> lib/livepatch/test_klp_convert1.tmp.ko somewhere?  I should be able to
>> start debug with those files.
>>
> 
> I sent you both files off list.
> 
> It looks like klp-convert doesn't use the correct size. It finds a 
> struct of size 12 hence 3 entries for a section of size 40.
> 
> On PPC32 the struct has size 8 (void * is 4 and int is 4).
> 
> But I'm cross-building from x86_64 where the struct is 8 + 4 = 12.
> 
> Can it be the reason ?
> 

I'm pretty sure that is it.  I haven't had much runtime with klp-convert
and cross-building (I've only found one big/little endian bug with
x86_64->s390x) and was going to ask you how you were testing :)

Do you know if there are other kernel build tools that deal with similar
situations?  This seems like a tricky job for the userspace build tool
to determine non-native target struct layout.

In the meantime, hacking in:

 struct klp_module_reloc {
-       void *sym;
+       uint32_t sym;
        unsigned int sympos;
 } __packed;

gets me generating an output .ko file, but the readelf output doesn't
look right.

I'll add this to the patchset TODO list, but may not get to it for a
while -- is there any chance the above hack works or could you test a
local non-cross build?

Thanks,

-- 
Joe

