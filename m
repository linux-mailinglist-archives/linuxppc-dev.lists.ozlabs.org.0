Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175CD7FCE58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 06:37:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg7Pd4Vrlz3dKv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 16:37:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=shenghui.qu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 382 seconds by postgrey-1.37 at boromir; Wed, 29 Nov 2023 14:21:16 AEDT
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg4NX2w05z3cNQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 14:21:14 +1100 (AEDT)
X-QQ-mid: bizesmtp72t1701227498tlu6ywz2
Received: from [127.0.0.1] ( [223.112.234.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Nov 2023 11:11:35 +0800 (CST)
X-QQ-SSF: 01400000000000G0V000000A0000000
X-QQ-FEAT: craTAQwGG7Iwxg7SROX92n8DiPh1JyeognOStUAmROp7GXXTZqFkLge/hp8G0
	c1NM7TV+TKekuM5kwlw2cqqbTXlvNeBKVez2yubeQoHeH98XHQB4orM7agcs1szoi6sln9F
	NnDSHZmvpNZJOTCi9B8aK0n7hp5uhXEQhJmrlFN6us3LF/mSmWvodoXV05U0xBxkFKmwa+B
	4GVBFrCwE9SJ41PNGDbJT6Y/WJ0eAypVFtPsgUhS7tkch7e0LUSmjzrqIO410ABXxMjkH18
	iIxuXYADRX8BYuGrR8xeqxkaup6SKQzHCAmsHJBci7AwrBwDwePiqCBRSWiQWydTaYvSazb
	qCe6HQVQqFZYgCjppB0mg5dNf3MSqj1IXn6g3L3g9/zbXts2lrJWc5jcpfFlJsq9yNEcf1/
	YIHY/yGS7EyPcZAqOa85krQWHxP61JPQ
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 12929403814008381183
Content-Type: multipart/alternative;
 boundary="------------FZwLF8cqoepgGllWYD04RF4z"
Message-ID: <5483EB9B257023CA+c5fce1e4-2f83-46a7-8c41-ec9b43619a81@shingroup.cn>
Date: Wed, 29 Nov 2023 11:11:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] powerpc: Add PVN support for HeXin C2000 processor
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, Zhao Ke <ke.zhao@shingroup.cn>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, fbarrat@linux.ibm.com,
 ajd@linux.ibm.com, arnd@arndb.de, gregkh@linuxfoundation.org
References: <20231123093611.98313-1-ke.zhao@shingroup.cn>
 <CX7FPX15PN0F.W7PEA51B0KD6@wheely>
From: =?UTF-8?B?UXUgU2hlbmdodWkg556/55ub6L6J?= <shenghui.qu@shingroup.cn>
In-Reply-To: <CX7FPX15PN0F.W7PEA51B0KD6@wheely>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz7a-0
X-Mailman-Approved-At: Wed, 29 Nov 2023 16:36:59 +1100
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
Cc: dawei.li@shingroup.cn, luming.yu@shingroup.cn, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------FZwLF8cqoepgGllWYD04RF4z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Nick

Thanks for your comments.

On 2023/11/25 7:35, Nicholas Piggin wrote:
> On Thu Nov 23, 2023 at 7:36 PM AEST, Zhao Ke wrote:
>> HeXin Tech Co. has applied for a new PVN from the OpenPower Community
>> for its new processor C2000. The OpenPower has assigned a new PVN
>> and this newly assigned PVN is 0x0066, add pvr register related
>> support for this PVN.
>>
>> Signed-off-by: Zhao Ke<ke.zhao@shingroup.cn>
>> Link:https://discuss.openpower.foundation/t/how-to-get-a-new-pvr-for-processors-follow-power-isa/477/10
>> ---
>> 	v0 -> v1:
>> 	- Fix .cpu_name with the correct description
>> ---
>> ---
>>   arch/powerpc/include/asm/reg.h            |  1 +
>>   arch/powerpc/kernel/cpu_specs_book3s_64.h | 15 +++++++++++++++
>>   arch/powerpc/kvm/book3s_pr.c              |  1 +
>>   arch/powerpc/mm/book3s64/pkeys.c          |  3 ++-
>>   arch/powerpc/platforms/powernv/subcore.c  |  3 ++-
>>   drivers/misc/cxl/cxl.h                    |  3 ++-
>>   6 files changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
>> index 4ae4ab9090a2..7fd09f25452d 100644
>> --- a/arch/powerpc/include/asm/reg.h
>> +++ b/arch/powerpc/include/asm/reg.h
>> @@ -1361,6 +1361,7 @@
>>   #define PVR_POWER8E	0x004B
>>   #define PVR_POWER8NVL	0x004C
>>   #define PVR_POWER8	0x004D
>> +#define PVR_HX_C2000	0x0066
>>   #define PVR_POWER9	0x004E
>>   #define PVR_POWER10	0x0080
>>   #define PVR_BE		0x0070
>> diff --git a/arch/powerpc/kernel/cpu_specs_book3s_64.h b/arch/powerpc/kernel/cpu_specs_book3s_64.h
>> index c370c1b804a9..367c9f6d9be5 100644
>> --- a/arch/powerpc/kernel/cpu_specs_book3s_64.h
>> +++ b/arch/powerpc/kernel/cpu_specs_book3s_64.h
>> @@ -238,6 +238,21 @@ static struct cpu_spec cpu_specs[] __initdata = {
>>   		.machine_check_early	= __machine_check_early_realmode_p8,
>>   		.platform		= "power8",
>>   	},
>> +	{	/* 2.07-compliant processor, HeXin C2000 processor */
>> +		.pvr_mask		= 0xffffffff,
>> +		.pvr_value		= 0x00660000,
>> +		.cpu_name		= "POWER8 (raw)",
> If this is a raw mode, it should go with the raw POWER8 entry.
> The raw vs architected entries are already out of order with
> POWER6, but we should fix that too.
>
> You may want your PVR mask to follow the other raw examples too,
> but it depends on how you foresee PVR being used. Using 0xffff0000
> allows you to increment the low part of the PVR and existing
> kernels will continue to match it. You can then add a specific
> match for the older version if you need to add special handling
> for it (e.g., see how POWER9 is handled).
>
> Do you want .cpu_name to be "POWER8 (raw)"? You could call it
> "HX-C2000", as Michael suggested earlier.

**Following your suggestion, we have discussed internally and decided to 
modify the cpu_name and pvr_mask.

>
>> +		.cpu_features		= CPU_FTRS_POWER8,
>> +		.cpu_user_features	= COMMON_USER_POWER8,
>> +		.cpu_user_features2	= COMMON_USER2_POWER8,
>> +		.mmu_features		= MMU_FTRS_POWER8,
>> +		.icache_bsize		= 128,
>> +		.dcache_bsize		= 128,
>> +		.cpu_setup		= __setup_cpu_power8,
>> +		.cpu_restore		= __restore_cpu_power8,
>> +		.machine_check_early	= __machine_check_early_realmode_p8,
>> +		.platform		= "power8",
>> +	},
>>   	{	/* 3.00-compliant processor, i.e. Power9 "architected" mode */
>>   		.pvr_mask		= 0xffffffff,
>>   		.pvr_value		= 0x0f000005,
>> diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
>> index 9118242063fb..5b92619a05fd 100644
>> --- a/arch/powerpc/kvm/book3s_pr.c
>> +++ b/arch/powerpc/kvm/book3s_pr.c
>> @@ -604,6 +604,7 @@ static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, u32 pvr)
>>   	case PVR_POWER8:
>>   	case PVR_POWER8E:
>>   	case PVR_POWER8NVL:
>> +	case PVR_HX_C2000:
>>   	case PVR_POWER9:
>>   		vcpu->arch.hflags |= BOOK3S_HFLAG_MULTI_PGSIZE |
>>   			BOOK3S_HFLAG_NEW_TLBIE;
>> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
>> index 125733962033..c38f378e1942 100644
>> --- a/arch/powerpc/mm/book3s64/pkeys.c
>> +++ b/arch/powerpc/mm/book3s64/pkeys.c
>> @@ -89,7 +89,8 @@ static int __init scan_pkey_feature(void)
>>   			unsigned long pvr = mfspr(SPRN_PVR);
>>   
>>   			if (PVR_VER(pvr) == PVR_POWER8 || PVR_VER(pvr) == PVR_POWER8E ||
>> -			    PVR_VER(pvr) == PVR_POWER8NVL || PVR_VER(pvr) == PVR_POWER9)
>> +			    PVR_VER(pvr) == PVR_POWER8NVL || PVR_VER(pvr) == PVR_POWER9 ||
>> +				PVR_VER(pvr) == PVR_HX_C2000)
>>   				pkeys_total = 32;
>>   		}
>>   	}
>> diff --git a/arch/powerpc/platforms/powernv/subcore.c b/arch/powerpc/platforms/powernv/subcore.c
>> index 191424468f10..58e7331e1e7e 100644
>> --- a/arch/powerpc/platforms/powernv/subcore.c
>> +++ b/arch/powerpc/platforms/powernv/subcore.c
>> @@ -425,7 +425,8 @@ static int subcore_init(void)
>>   
>>   	if (pvr_ver != PVR_POWER8 &&
>>   	    pvr_ver != PVR_POWER8E &&
>> -	    pvr_ver != PVR_POWER8NVL)
>> +	    pvr_ver != PVR_POWER8NVL &&
>> +		pvr_ver != PVR_HX_C2000)
>>   		return 0;
>>   
>>   	/*
>> diff --git a/drivers/misc/cxl/cxl.h b/drivers/misc/cxl/cxl.h
>> index 0562071cdd4a..9ac2991b29c7 100644
>> --- a/drivers/misc/cxl/cxl.h
>> +++ b/drivers/misc/cxl/cxl.h
>> @@ -836,7 +836,8 @@ static inline bool cxl_is_power8(void)
>>   {
>>   	if ((pvr_version_is(PVR_POWER8E)) ||
>>   	    (pvr_version_is(PVR_POWER8NVL)) ||
>> -	    (pvr_version_is(PVR_POWER8)))
>> +	    (pvr_version_is(PVR_POWER8)) ||
>> +		(pvr_version_is(PVR_HX_C2000)))
>>   		return true;
>>   	return false;
>>   }
> These should follow the same alignment pattern as the other lines.
I agree with you, this is a low-level mistake.

> Thanks,
> Nick
>
--------------FZwLF8cqoepgGllWYD04RF4z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi, Nick<br>
    </p>
    <pre class="moz-quote-pre" wrap="">Thanks for your comments. 
</pre>
    <div class="moz-cite-prefix">On 2023/11/25 7:35, Nicholas Piggin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CX7FPX15PN0F.W7PEA51B0KD6@wheely">
      <pre class="moz-quote-pre" wrap="">On Thu Nov 23, 2023 at 7:36 PM AEST, Zhao Ke wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">HeXin Tech Co. has applied for a new PVN from the OpenPower Community
for its new processor C2000. The OpenPower has assigned a new PVN
and this newly assigned PVN is 0x0066, add pvr register related
support for this PVN.

Signed-off-by: Zhao Ke <a class="moz-txt-link-rfc2396E" href="mailto:ke.zhao@shingroup.cn">&lt;ke.zhao@shingroup.cn&gt;</a>
Link: <a class="moz-txt-link-freetext" href="https://discuss.openpower.foundation/t/how-to-get-a-new-pvr-for-processors-follow-power-isa/477/10">https://discuss.openpower.foundation/t/how-to-get-a-new-pvr-for-processors-follow-power-isa/477/10</a>
---
	v0 -&gt; v1:
	- Fix .cpu_name with the correct description
---
---
 arch/powerpc/include/asm/reg.h            |  1 +
 arch/powerpc/kernel/cpu_specs_book3s_64.h | 15 +++++++++++++++
 arch/powerpc/kvm/book3s_pr.c              |  1 +
 arch/powerpc/mm/book3s64/pkeys.c          |  3 ++-
 arch/powerpc/platforms/powernv/subcore.c  |  3 ++-
 drivers/misc/cxl/cxl.h                    |  3 ++-
 6 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 4ae4ab9090a2..7fd09f25452d 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -1361,6 +1361,7 @@
 #define PVR_POWER8E	0x004B
 #define PVR_POWER8NVL	0x004C
 #define PVR_POWER8	0x004D
+#define PVR_HX_C2000	0x0066
 #define PVR_POWER9	0x004E
 #define PVR_POWER10	0x0080
 #define PVR_BE		0x0070
diff --git a/arch/powerpc/kernel/cpu_specs_book3s_64.h b/arch/powerpc/kernel/cpu_specs_book3s_64.h
index c370c1b804a9..367c9f6d9be5 100644
--- a/arch/powerpc/kernel/cpu_specs_book3s_64.h
+++ b/arch/powerpc/kernel/cpu_specs_book3s_64.h
@@ -238,6 +238,21 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.machine_check_early	= __machine_check_early_realmode_p8,
 		.platform		= "power8",
 	},
+	{	/* 2.07-compliant processor, HeXin C2000 processor */
+		.pvr_mask		= 0xffffffff,
+		.pvr_value		= 0x00660000,
+		.cpu_name		= "POWER8 (raw)",
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If this is a raw mode, it should go with the raw POWER8 entry.
The raw vs architected entries are already out of order with
POWER6, but we should fix that too.

You may want your PVR mask to follow the other raw examples too,
but it depends on how you foresee PVR being used. Using 0xffff0000
allows you to increment the low part of the PVR and existing
kernels will continue to match it. You can then add a specific
match for the older version if you need to add special handling
for it (e.g., see how POWER9 is handled).

Do you want .cpu_name to be "POWER8 (raw)"? You could call it
"HX-C2000", as Michael suggested earlier.</pre>
    </blockquote>
    <br>
    <b></b>Following your suggestion, we have discussed internally and
    decided to modify the cpu_name and pvr_mask.<br>
    <br>
    <blockquote type="cite" cite="mid:CX7FPX15PN0F.W7PEA51B0KD6@wheely">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+		.cpu_features		= CPU_FTRS_POWER8,
+		.cpu_user_features	= COMMON_USER_POWER8,
+		.cpu_user_features2	= COMMON_USER2_POWER8,
+		.mmu_features		= MMU_FTRS_POWER8,
+		.icache_bsize		= 128,
+		.dcache_bsize		= 128,
+		.cpu_setup		= __setup_cpu_power8,
+		.cpu_restore		= __restore_cpu_power8,
+		.machine_check_early	= __machine_check_early_realmode_p8,
+		.platform		= "power8",
+	},
 	{	/* 3.00-compliant processor, i.e. Power9 "architected" mode */
 		.pvr_mask		= 0xffffffff,
 		.pvr_value		= 0x0f000005,
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 9118242063fb..5b92619a05fd 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -604,6 +604,7 @@ static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, u32 pvr)
 	case PVR_POWER8:
 	case PVR_POWER8E:
 	case PVR_POWER8NVL:
+	case PVR_HX_C2000:
 	case PVR_POWER9:
 		vcpu-&gt;arch.hflags |= BOOK3S_HFLAG_MULTI_PGSIZE |
 			BOOK3S_HFLAG_NEW_TLBIE;
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 125733962033..c38f378e1942 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -89,7 +89,8 @@ static int __init scan_pkey_feature(void)
 			unsigned long pvr = mfspr(SPRN_PVR);
 
 			if (PVR_VER(pvr) == PVR_POWER8 || PVR_VER(pvr) == PVR_POWER8E ||
-			    PVR_VER(pvr) == PVR_POWER8NVL || PVR_VER(pvr) == PVR_POWER9)
+			    PVR_VER(pvr) == PVR_POWER8NVL || PVR_VER(pvr) == PVR_POWER9 ||
+				PVR_VER(pvr) == PVR_HX_C2000)
 				pkeys_total = 32;
 		}
 	}
diff --git a/arch/powerpc/platforms/powernv/subcore.c b/arch/powerpc/platforms/powernv/subcore.c
index 191424468f10..58e7331e1e7e 100644
--- a/arch/powerpc/platforms/powernv/subcore.c
+++ b/arch/powerpc/platforms/powernv/subcore.c
@@ -425,7 +425,8 @@ static int subcore_init(void)
 
 	if (pvr_ver != PVR_POWER8 &amp;&amp;
 	    pvr_ver != PVR_POWER8E &amp;&amp;
-	    pvr_ver != PVR_POWER8NVL)
+	    pvr_ver != PVR_POWER8NVL &amp;&amp;
+		pvr_ver != PVR_HX_C2000)
 		return 0;
 
 	/*
diff --git a/drivers/misc/cxl/cxl.h b/drivers/misc/cxl/cxl.h
index 0562071cdd4a..9ac2991b29c7 100644
--- a/drivers/misc/cxl/cxl.h
+++ b/drivers/misc/cxl/cxl.h
@@ -836,7 +836,8 @@ static inline bool cxl_is_power8(void)
 {
 	if ((pvr_version_is(PVR_POWER8E)) ||
 	    (pvr_version_is(PVR_POWER8NVL)) ||
-	    (pvr_version_is(PVR_POWER8)))
+	    (pvr_version_is(PVR_POWER8)) ||
+		(pvr_version_is(PVR_HX_C2000)))
 		return true;
 	return false;
 }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
These should follow the same alignment pattern as the other lines.</pre>
    </blockquote>
    I agree with you, this is a low-level mistake.<br>
    <br>
    <blockquote type="cite" cite="mid:CX7FPX15PN0F.W7PEA51B0KD6@wheely">
      <pre class="moz-quote-pre" wrap="">
Thanks,
Nick

</pre>
    </blockquote>
  </body>
</html>

--------------FZwLF8cqoepgGllWYD04RF4z--

